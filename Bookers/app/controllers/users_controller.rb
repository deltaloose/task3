class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end
	def index
		@users =User.all
	end
	before_action :set_current_user
	def set_current_user
	@current_user = User.find_by(id: session[:user_id])
	end
	def edit
		@user = User.find(params[:id])
	end
end
