class PageStaticsController < ApplicationController
	before_action :disable_nav, only: [:index]

	def index
		@items = Item.all
	end

	def disable_nav
		@disable_nav = true
	end
end
