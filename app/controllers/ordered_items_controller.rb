class OrderedItemsController < ApplicationController

	def create
		OrderedItems.create(order_id: params[:order_id], item_id: params[:item_id], quantity: 1)
	end

end
