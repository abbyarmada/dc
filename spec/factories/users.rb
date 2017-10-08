FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :admin do
      after(:create) { |user| user.add_role(:admin) }
    end
  end
end
