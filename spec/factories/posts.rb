# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association :user
    content { Faker::WorldCup.stadium }
    date_post { '2019-11-28 11:38:18' }
  end
end
