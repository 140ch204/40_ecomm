# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
user_count = 0
user_array = []
10.times do
	user_array << User.create(email: Faker::Internet.email, password: Faker::Internet.password)
  user_count += 1
end
puts "#{user_count} users created"

# Item.destroy_all
item_count = 0
image_url = ["https://cdn.mos.cms.futurecdn.net/vChK6pTy3vN3KbYZ7UU7k3-970-80.jpg",	
			"https://www.uncompagnon.fr/upload/annonces/71624/02-20190325_114008.jpg",
			"https://www.uncompagnon.fr/upload/annonces/75936/02-img_4207.jpg",
			"https://www.ragdollfrance.com/images/labro_031527_900px.jpg",
			"https://img.ohmymag.com/article/480/bengal/chaton-bengal_d52207e2a93014e5b31895cb6c7007496de6cc73.jpg",
			"https://www.ragdollfrance.com/images/labro_031527_900px.jpg",
			"https://www.uncompagnon.fr/upload/annonces/78101/01-dsc05905.jpg",
			"https://www.uncompagnon.fr/upload/annonces/78016/04-image4.jpg",
			"https://www.uncompagnon.fr/upload/annonces/78001/03-img-20190709-wa0001.jpg",
			"https://www.uncompagnon.fr/upload/annonces/77198/02-1911nessycrbl2.jpg",
			"https://www.uncompagnon.fr/upload/annonces/77152/01-img_9444.jpg",
			"https://www.uncompagnon.fr/upload/annonces/77031/02-img_5952.jpg",
			"https://www.uncompagnon.fr/upload/annonces/78111/01-_20191022_174439.jpg",
			"https://www.uncompagnon.fr/upload/annonces/78042/02-4f07cb60-0812-44e6-82db-53de2ece9b6b.jpg",
			"https://www.zooplus.fr/magazine/wp-content/uploads/2017/10/fotolia_94870753-1-768x512.jpg"]

title = ["Naruto","Luffy","Zoro","Tigrou","Caramel","Felix","Simba","Gribouille","Garfield","Minette","Chipie","Caline","Nala","Maya","Mimi"]

description = ["The Birman, also called 
	the 'Sacred Cat of Burma', is a domestic cat breed. The Birman is a long-haired, 
	colour-pointed cat distinguished by a silky coat.", "The Bengal 
	cat is a domesticated cat breed created from hybrids of domestic cats,
	the Asian leopard cat (Prionailurus bengalensis) and the Egyptian Mau.", "The Ragdoll 
	is a cat breed with a color point coat and blue eyes. They are large
	and muscular semi-longhair cats with a soft and silky coat.", "The Maine Coon is the 
	largest domesticated cat breed. It has a distinctive physical appearance and 
	valuable hunting skills. It is one of the oldest.", "The Siamese 
	cat is one of the first distinctly recognized breeds of Asian cat. 
	It's one of several varieties of cat native to China and brought to 
	Thailand."]

20.times do
	Item.create(title: title.sample, description: description.sample, price: 50, image_url: image_url.sample)
	item_count += 1
end
puts "#{item_count} items created"

cart_count = 0
user_array.each do |user|
  Cart.create(user: user)
  cart_count += 1
end
puts "#{cart_count} carts created"

cart_elem_count = 0
50.times do 
  CartElement.create(item_id: Item.all.sample.id, cart: Cart.all.sample, quantity: rand(1..5))
  cart_elem_count += 1
end
puts "#{cart_elem_count} cart_elements created"

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