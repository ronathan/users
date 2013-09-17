class TweetsController < ApplicationController
	
	before_action :require_current_user

	def index
		@tweets = Tweet.all
	end

	def new
		@tweet = Tweet.new
	end

	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.user = @current_user
		if @tweet.save
			redirect_to tweets_path
		end
	end

	def edit
		@tweet = Tweet.find(params[:id])
	end

	def update
		@tweet = Tweet.find(params[:id])
		@tweet.update(tweet_params)
		redirect_to tweet_path(@tweet)
	end

	def show
		@tweet = Tweet.find(params[:id])
	end

	def destroy
		@tweet = Tweet.find(params[:id])
		@tweet.destroy
		redirect_to new_tweet_path
	end

	private

	def tweet_params
		params.require(:tweet).permit(:content)
	end
end
