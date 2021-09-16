# frozen_string_literal: true

# Class for documents
class ParseDocumentService
  attr_reader :doc

  def initialize(doc)
    @doc = doc
  end

  def parse_text_from_doc
    reader = Henkei.new(doc.path)
    reader.text
  end
end
