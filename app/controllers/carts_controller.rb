class CartsController < ApplicationController

  def new
    @cart = Cart.new
  end
  
  def create
    @cart = Cart.new
  end

  def show
    @cart = Cart.find(params[:id])
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
