class CartElementsController < ApplicationController

  def create
    CartElement.create(item_id: params[:item_id], cart_id: params[:cart_id], quantity: 1)
    redirect_to user_cart_path(current_user.id, current_user.cart.id)
  end

  def update
    @cart_elem = CartElement.find(params[:cart_elem_id])
    @cart_elem.update(quantity: @cart_elem.quantity + params[:quantity].to_i)
    redirect_to user_cart_path(current_user.id, params[:id])
  end

  def destroy
    @cart_elem = CartElement.find(params[:cart_elem_id])
    @cart_elem.destroy
    redirect_to user_cart_path(current_user.id, params[:id])
  end
end
