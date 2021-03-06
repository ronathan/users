class UsersController < ApplicationController
	
	before_action :require_current_user, except: [:new, :create]

	def index
		@users = User.all
	end

	def new
		@user = User.new()
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to login_path
		else
			render action: :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user)
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to new_user_path
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

end
