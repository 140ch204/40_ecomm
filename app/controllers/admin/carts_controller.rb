module Admin

  class CartsController < ApplicationController
    before_action :check_if_admin

    def index
      @carts = Cart.all
    end

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
      @cart = Cart.find(params[:id])
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

    def check_if_admin
      if current_user.admin == false
        flash[:notice] = "Must be admin"
        redirect_to root_path
      end
    end

  end
end
