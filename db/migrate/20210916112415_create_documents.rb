# frozen_string_literal: true

# Class for Documents
class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.string :file
      t.text :text_body

      t.timestamps
    end
  end
end
