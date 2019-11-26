# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_count = 0
10.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password)
  user_count += 1
end
puts "#{user_count} users created"


item_count = 0
10.times do
  Item.create(title: Faker::Book.title, description: "test", price: 50, image_url: Faker::Internet.url)
  item_count += 1
end
puts "#{item_count} items created"