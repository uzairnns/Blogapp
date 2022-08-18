# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name  { Faker::Name.unique.name }
    password { Faker::Internet.password(min_length: 6) }

    # avatar {File.new("#{Rails.root}/spec/files/images/default.jpeg")}
    avatar { Rack::Test::UploadedFile.new("#{Rails.root}/spec/files/images/default.jpeg", 'image/jpeg') }
  end
end
