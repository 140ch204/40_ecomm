class ChargesController < ApplicationController

	after_action :generate_order, only: [:create]
	after_action :generate_ordered_elements, only: [:create]
	after_action :clean_cart, only: [:create]

	def new
		puts "X"*50
		puts params
		@user = current_user
		@cart = @user.cart
		@cart_items = CartElement.where(cart_id: @cart.id)
		@amount = 0
		@cart_items.each do |item|
			@amount += Item.find(item.item_id).price.to_i * item.quantity
		end
	end

	def create
		puts "X" *50
		puts params
		@amount = params[:amount]
		customer = Stripe::Customer.create({
			email: params[:stripeEmail],
			source: params[:stripeToken],
		})

		charge = Stripe::Charge.create({
			customer: customer.id,
			amount: @amount,
			description: "Paiement de #{current_user.email}",
			currency: 'eur',
		})

		redirect_to root_path

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end

	def generate_order
		Order.create(user_id: current_user.id)
	end

	def generate_ordered_elements
		@user = current_user
		@cart = @user.cart
		@cart_items = CartElement.where(cart_id: @cart.id)
		@cart_items.each do |item|
			order_id = Order.last.id
			puts order_id
			OrderedItem.create(order_id: order_id,
				item_id: item.id,
				quantity: item.quantity)
		end
	end

	def clean_cart
		@user = current_user
		@cart = @user.cart
		@cart_items = CartElement.where(cart_id: @cart.id)
		@cart_items.each do |item|
			item.destroy
		end
	end

end