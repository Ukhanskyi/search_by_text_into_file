# frozen_string_literal: true

# Class for documents
class DocumentsController < ApplicationController
  def index
    @documents = collection
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @document.text_body = DocumentService.new(@document.file).parse_text

    respond_to do |format|
      if @document.save
        format.html { redirect_to root_path, notice: 'Document was successfully created.' }
      else
        format.html { raise 'Document wasn`t created.' }
      end
    end
  end

  def search
    @documents = collection

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def search_params
    params.permit(:query)
  end

  def collection
    DocumentsSearch.new(query: search_params[:query]).search
  end

  def document_params
    params.require(:document).permit(:file)
  end
end
