# frozen_string_literal: true

# Class for documents
class DocumentService
  attr_reader :doc

  def initialize(doc)
    @doc = doc
  end

  def parse_text
    reader = Henkei.new(doc.path)
    reader.text
  end
end
