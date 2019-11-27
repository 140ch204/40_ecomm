class CartElementsController < ApplicationController


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
