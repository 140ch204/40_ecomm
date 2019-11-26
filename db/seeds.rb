# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
user_count = 0
10.times do
	User.create(email: Faker::Internet.email, password: Faker::Internet.password)
	user_count += 1
end
puts "#{user_count} users created"

Item.destroy_all
item_count = 0
10.times do
	Item.create(title: Faker::Book.title, description: "test", price: 50, image_url: Faker::Internet.url)
	item_count += 1
end
puts "#{item_count} items created"

Order.destroy_all
order_count = 0
20.times do
	Order.create(user_id: User.all.sample.id)
	order_count += 1
end
puts "#{order_count} orders created"

OrderedItem.destroy_all
ordereditem_count = 0
50.times do
	OrderedItem.create(order_id: Order.all.sample.id, item_id: Item.all.sample.id, quantity: rand(1..5))
	ordereditem_count += 1
end
puts "#{ordereditem_count} ordered item created"