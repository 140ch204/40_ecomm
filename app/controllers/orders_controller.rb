class OrdersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
	before_action :is_admin?, only: [:index]

	def index
		@orders = Orders.all
	end

	def show
		@order = Order.find(params[:id])
		@ordered_items = OrderedItems.where(order_id: @order.id)
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
