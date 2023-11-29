# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association :user
    description { Faker::Number.number(digits: 3) }
    title { Faker::Number.between(from: 0, to: 1) }
    content { Faker::Number.between(from: 0, to: 1) }
  end
end
