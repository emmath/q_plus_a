FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user#{n}@qplusa.com" }
    password "password"
    password_confirmation "password"
  end
end
