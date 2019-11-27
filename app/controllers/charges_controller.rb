class ChargesController < ApplicationController

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
			customer: current_user.id,
			amount: @amount,
			description: "Paiement de #{current_user.email}",
			currency: 'eur',
		})

		redirect_to root_path

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end
end