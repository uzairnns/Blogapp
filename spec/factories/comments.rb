# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :user
    association :post
    body { Faker::String.random(length: 3..12) }
    cover_picture do
      Rack::Test::UploadedFile.new(Rails.root.join('./spec/files/images/default.jpeg').to_s, 'image/jpeg')
    end
  end
end
