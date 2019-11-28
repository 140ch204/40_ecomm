class Admin::AdminController < ApplicationController
	before_action :check_if_admin
	
	def index
		@nb_users = User.all.size
		@nb_orders = Order.all.size
		@nb_items = Item.all.size
		@carts_value = carts_value
		@amount_sells = sells_value
	end

	private

	def sells_value
		@ordered_items = OrderedItem.all
		@amount = 0
		@ordered_items.each do |item|
			@amount += Item.find(item.item_id).price * item.quantity
		end
		return @amount
	end

	def carts_value
		@cart_items = CartElement.all
		@amount = 0
		@cart_items.each do |item|
			@amount += Item.find(item.item_id).price * item.quantity
		end
		return @amount
	end

	def check_if_admin
		if current_user.admin == false
			flash[:notice] = "Must be admin"
			redirect_to root_path
		end
	end

end
