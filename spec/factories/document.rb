# frozen_string_literal: true

FactoryBot.define do
  factory :document do
    file      { Rack::Test::UploadedFile.new("#{Rails.root}/spec/files/test_text_file.docx") }
    text_body { "Some random text.\n" }
  end

  trait :image_doc do
    file { Rack::Test::UploadedFile.new("#{Rails.root}/spec/files/test_image_file.jpg") }
  end
end
