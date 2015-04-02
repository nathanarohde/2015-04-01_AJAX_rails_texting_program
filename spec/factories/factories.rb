FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Dude #{n}"}
    sequence(:number) { |n| "123456789#{n}"}
    sequence(:email) { |n| "dude#{n}@dudemail.com" }
    password('password')
    password_confirmation('password')
  end
end
