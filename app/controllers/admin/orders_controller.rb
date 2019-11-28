module Admin

	class OrdersController < ApplicationController
		before_action :check_if_admin


		def index
			@orders = Order.all

		end

		def show
			@order = Order.find(params[:id])
			@ordered_items = OrderedItem.where(order_id: @order.id)
			@purchases = []
			@amount = 0
			@ordered_items.each do |item|
				@purchases << Item.find(item.item_id)
				@amount += Item.find(item.item_id).price * item.quantity
			end
		end

		def new
		end

		def create
			@order = Order.create
		end

		def edit
		end

		def update
		end

		def destroy
		end

		private

		def check_if_admin
			if current_user.admin == false
				flash[:notice] = "Must be admin"
				redirect_to root_path
			end
		end

		def sell_value
			@ordered_items = OrderedItem.find_by(order_id: order.id)
			@amount = 0
			@ordered_items.each do |item|
				@amount += Item.find(item.item_id).price * item.quantity
			end
			return @amount
		end
	end

end
