# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    association :user
    association :post
    content { Faker::Movie.quote }
    date_comment { '2020-01-28 11:38:18' }
  end
end
