# frozen_string_literal: true

# Class for documents
class DocumentsController < ApplicationController
  def index
    @documents = Document.all
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @document.text_body = ParseDocumentService.new(@document.file).parse_text_from_doc

    respond_to do |format|
      if @document.save
        format.html { redirect_to root_path, notice: 'Document was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def document_params
    params.require(:document).permit(:file)
  end
end
