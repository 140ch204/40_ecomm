class ChargesController < ApplicationController

	def new
	    @item = Item.find(params[:id])
	    @amount = @item.price
	end

	def create

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
end
