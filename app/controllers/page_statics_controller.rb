class PageStaticsController < ApplicationController
  def index
    @items = Item.all
  end
end
