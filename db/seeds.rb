require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Hostel.destroy_all
User.destroy_all

user = User.new
user.email = 'admin@admin.com'
user.password = '123456'
user.password_confirmation = '123456'
user.first_name = Faker::Name.first_name
user.middle_name = Faker::Name.middle_name
user.first_surname = Faker::Name.last_name
user.second_surname = Faker::Name.last_name
user.gender = User.genders.keys.sample
user.bio = Faker::Hipster.paragraph
user.access_level = 'admin'

10.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = '123456'
  user.password_confirmation = '123456'
  user.first_name = Faker::Name.first_name
  user.middle_name = Faker::Name.middle_name
  user.first_surname = Faker::Name.last_name
  user.second_surname = Faker::Name.last_name
  user.gender = User.genders.keys.sample
  user.bio = Faker::Hipster.paragraph
  # Define if the created user has hostels by a random boolean value.
  while [true, false].sample
    file = open("https://loremflickr.com/1280/960/hostel")
    hostel = Hostel.new
    hostel.user = user
    hostel.name = Faker::FunnyName.name
    hostel.address = Faker::Address.street_address
    hostel.description = Faker::Hipster.paragraph
    hostel.save
    hostel.principal_image.attach(
      io: file,
      filename: "hostel_principal_image_#{hostel.id}.jpg",
      content_type: 'image/jpg'
    )
  end
end
