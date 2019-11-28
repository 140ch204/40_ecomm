class OrdersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
	# before_action :is_admin?, only: [:index]

	def index
		@user = current_user
		@orders = Order.where(user_id: @user.id)
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

end
