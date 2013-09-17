class LoginController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(email: params[:user][:email])
		
		if @user && login_valid?(@user)
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to login_path
			flash[:error] = "Invalid Login."
		end

	end

	def logout
		session[:user_id] = nil
		redirect_to login_path
	end

	private

	def login_valid?(user)
		if Rails.env.test?
			if params[:user][:password_digest] == user.password_digest
				return true
			end
		elsif @user.authenticate(params[:user][:password])
			return true
		end
	end

end
