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
image_url = ["http://www.ict-historic.eu/wp-content/uploads/2018/11/magnifiques-chatons-type-siamois-1_450x338z10.jpg",	
			"http://www.ict-historic.eu/wp-content/uploads/2018/11/1f9ec56504c1fbb1034fac601ec5ce56-1.jpg",
			"http://www.royalfragrance.fr/wp-content/uploads/2015/07/M1redim1.jpg",
			"https://www.wikichat.fr/wp-content/uploads/sites/2/dsc04085-1024x685.jpg",
			"https://www.uncompagnon.fr/upload/annonces/71624/02-20190325_114008.jpg",
			"https://www.uncompagnon.fr/upload/annonces/75936/02-img_4207.jpg",
			"https://www.eleveurs-online.com/data/eleveur/148/1600-147188.150.jpg",
			"https://www.ragdollfrance.com/images/labro_031527_900px.jpg",
			"https://img.ohmymag.com/article/480/bengal/chaton-bengal_d52207e2a93014e5b31895cb6c7007496de6cc73.jpg",
			"https://www.ragdollfrance.com/images/labro_031527_900px.jpg",
			"https://www.cany-express.com/public/img/big/2jpg_5b53320a3b695.jpg",	
			"https://www.zooplus.fr/magazine/wp-content/uploads/2017/10/fotolia_94870753-1-768x512.jpg"]

title = ["Tigrou","Caramel","Felix","Simba","Gribouille","Garfield","Minette","Chipie","Caline","Nala","Maya","Mimi"]

description = "Le chaton naît aveugle (les yeux fermés) et sourd. Il pèse de 100 à 110 grammes ; lorsqu’il ouvre les yeux, à l’âge de huit à douze jours, ils sont de couleur bleue jusqu’au changement définitif (vers deux mois). Tous les chatons naissent avec des rayures fantômes qui disparaissent peu à peu avec la pousse du poil. La chatte apprend aux chatons à se laver, se nourrir, etc. À quatre semaines, elle leur apporte leur première proie vivante, puis à cinq semaines, elle leur apprend les rudiments de la chasse. L’émancipation se produit entre huit et douze semaines, mais la séparation de la famille se déroule à l’âge de six à huit mois."
10.times do
	Item.create(title: title.sample, description: description, price: 50, image_url: image_url.sample)
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