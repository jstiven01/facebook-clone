# frozen_string_literal: true

FactoryBot.define do
  factory :reaction do
    association :user
    association :post
  end
end
