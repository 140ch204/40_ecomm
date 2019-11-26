module Admin

	class ChargesController < ApplicationController

		before_action :check_if_admin

		def new
			@event = Event.find(params[:id])
			@amount = @event.price
		end

		def create
		# Amount in cents

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

			rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to new_charge_path
		end

		def check_if_admin
			if current_user.is_admin == false
				flash[:admin] = "Must be admin"
		  	redirect_to root_path
		end
		end

	end
end