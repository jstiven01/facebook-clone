FactoryBot.define do
  factory :reaction do
    association :user
    association :post
  end
end
