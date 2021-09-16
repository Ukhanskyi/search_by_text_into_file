# frozen_string_literal: true

# Class for indexing Documents
class DocumentsIndex < Chewy::Index
  index_scope Document
  field :text_body, type: 'keyword'
end
