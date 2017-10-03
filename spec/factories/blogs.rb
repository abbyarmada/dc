# frozen_string_literal: true

FactoryGirl.define do
  factory :blog, class: Blog do
    name { Faker::Book.title }
    description { Faker::Seinfeld.quote }
  end
end
