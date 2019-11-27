class Cart < ApplicationRecord
	has_one :user
	has_many :cart_elements
	has_many :items, through: :cart_elements

	def cart_items
		user = current_user
		cart = user.cart
		cart_items = CartElement.where(cart_id: cart.id)
		return	cart_items
	end
end
