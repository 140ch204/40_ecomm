module Admin

  class ItemsController < ApplicationController
    before_action :check_if_admin

    def new
      @item = Item.new
    end

    def create
      permited_params = params.require().permit(:title, :price, :description, :image_url)
      @item = Item.new(permited_params)

      if @item.save
        flash[:success] = "Item created"
        redirect_to root_path
      else 
        render 'new'
      end
    end

    def index
      @items = Item.all
    end

    def show
      @item = Item.find(params[:id])

    end

    def update
    # Waiting for forms
    #permited_params = params.require().permit(:title, :price, :description, :image_url)
    @item = Item.find(params[:id])
    @item.update(permited_params)
    redirect_to item_path(params[:id])
    end

    def destroy
      @item = Item.find(params[:id])
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