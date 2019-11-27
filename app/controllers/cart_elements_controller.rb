class CartElementsController < ApplicationController


  def update
    @cart = CartElement.find(params[:cart_elem_id])
    @cart.update(permited_params)
  end

  def destroy
    @cart_elem = CartElement.find(params[:cart_elem_id])
    @cart_elem.destroy
    redirect_to user_cart_path(current_user.id, params[:id])
  end
end
