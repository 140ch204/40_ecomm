class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :show, :edit, :update, :destroy]
	before_action :is_admin?, only: [:index]
	before_action :check_user, only: [:index, :show, :edit, :update, :destroy]


	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end
	
	private

	def is_admin?
		if !current_user.nil? && current_user.admin = true
			return true
			flash[:notice] = "You can access admins' pages."
		end
	end

	def check_user
		if current_user.id != User.find(params[:id]).id
			flash[:notice] = "You can't see that."
			redirect_to root_path
		end
	end

end
