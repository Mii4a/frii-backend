FactoryBot.define do
  factory :user, class: User do
    name   { "test_user" } 
    email  { "user@email.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end