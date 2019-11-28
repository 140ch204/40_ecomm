module Admin

	class UsersController < ApplicationController
		before_action :check_if_admin

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

		def check_if_admin
			if current_user.admin == false
				flash[:notice] = "Must be admin"
				redirect_to root_path
			end
		end

	end
end
