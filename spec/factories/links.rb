FactoryGirl.define do
  factory :link do
    name { Faker::Book.title }
    url { Faker::Internet.url }
  end
end
