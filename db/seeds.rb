# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: 'example_user',
  email: 'example@user.com',
  password: 'password',
  password_confirmation: 'password'
)

(2..20).each do |n|
  User.create!(
    name: "example_user#{n}",
    email: "example#{n}@user.com",
    password: 'password',
    password_confirmation: 'password'
  )
end

tag_samples = [
  {tag_name: "aa"}
]