# frozen_string_literal: true

# Class for Document model
class Document < ApplicationRecord
  validates :text_body, presence: true

  mount_uploader :file, FileUploader

  update_index('documents') { self }
end
