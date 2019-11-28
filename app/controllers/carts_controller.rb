class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
  before_action :check_cart, only: [:index, :show, :edit, :update, :destroy]

  def new
    @cart = Cart.new
  end
  
  def create
    @user = current_user
    @item = Item.find(params[:item_id])
    @cart = Cart.create(user: current_user)
    CartElement.create(cart: @cart, item_id: @item.id, quantity: 1)
    redirect_to items_path
  end

  def show    
    @user = current_user
    @cart = Cart.find_by(user_id: @user.id)
    @cart_items = CartElement.where(cart_id: @cart.id)
    @items = []
    @amount = 0
    @cart_items.each do |item|
      @items << Item.find(item.item_id)
      @amount += Item.find(item.item_id).price * item.quantity
    end
  end

  def update
    @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end

  private
  
  def check_cart
    if current_user.id != Cart.find(params[:id]).user_id
      flash[:notice] = "You can't see that."
      redirect_to root_path
    end
  end
end
