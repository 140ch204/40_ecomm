class CartsController < ApplicationController

  def new
    @cart = Cart.new
  end
  
  def create
    @cart = Cart.new
  end

  def show
    current_user.cart_items
    
    @user = current_user
    @cart = Cart.find(params[:id])
    @cart_items = CartElement.where(cart_id: @cart.id)
    @items = []
    @amount = 0
    cart_items.each do |item|
      @items << Item.find(item.item_id)
      @amount += Item.find(item.item_id).price * item.quantity
    end
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(permited_params)
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end
end
