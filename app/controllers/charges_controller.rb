class ChargesController < ApplicationController

	after_action :generate_ordered_elements, only: [:create]
	after_action :generate_order, only: [:create]	
	after_action :clean_cart, only: [:create]

	def new
		@user = current_user
		@cart = @user.cart
		@cart_items = CartElement.where(cart_id: @cart.id)
		@amount = 0
		@cart_items.each do |item|
			@amount += Item.find(item.item_id).price.to_i * item.quantity
		end
	end

	def create
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

		redirect_to orders_path

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end

	private

	def generate_order
		orderx = Order.create(user_id: current_user.id)
		puts "X"*100
		puts "0"*100
		puts order_id = orderx.id
		puts "X"*100
		return order_id
	end

	def generate_ordered_elements
		@user = current_user
		@cart = @user.cart
		@cart_items = CartElement.where(cart_id: @cart.id)
		@order = Order.last.id
		puts "X"*100
		puts @order
		puts "X"*100
		@cart_items.each do |item|
			
			puts "X"*100
			puts item.id
			puts item.quantity

			puts "X"*100

			OrderedItem.create(order_id: @order,
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