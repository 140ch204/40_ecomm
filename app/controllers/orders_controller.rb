class OrdersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
	# before_action :is_admin?, only: [:index]

	def index
		@user = current_user
		@orders = Order.where(user_id: @user.id)
		puts "X" *50
		puts @orders
		puts "X" *50
	end

	def show
		@order = Order.find(params[:id])
		@ordered_items = OrderedItem.where(order_id: @order.id)
		@purchases = []
		@ordered_items.each do |item|
			@purchases << Item.find(item.item_id)
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
