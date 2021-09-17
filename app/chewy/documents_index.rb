# frozen_string_literal: true

# Class for indexing Documents
class DocumentsIndex < Chewy::Index
  settings analysis: {
    analyzer: {
      text_body: {
        tokenizer: 'keyword',
        filter: %w[lowercase word_delimiter]
      }
    }
  }

  index_scope Document
  field :text_body, analyzer: 'text_body'
end
