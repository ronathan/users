require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  test "should get index" do
  	login_as(:one)
  	get :index
  	assert_response :success
  end

  test "should get new" do
  	login_as(:one)
  	get :new
  	assert_response :success
  end

  test "should post create" do 
  	login_as(:one)
  	tweet = tweets(:one)
  	user = users(:one)

  	assert_difference('Tweet.count') do
  		post :create, { user_id: user.id, tweet: { content: tweet.content } }
  	end

  	assert_redirected_to tweets_path
  	
  	tweet = assigns(:tweet)
  	assert tweet.user
  end

  test "should get edit" do
  	login_as(:one)
		get :edit, id: tweets(:one).id 
		assert_response :success
	end

	test "should post update" do
		login_as(:one)
		tweet = tweets(:one)
		user = users(:one)

		patch :update, id: tweet.id, tweet: { content: "edited tweet!" } 

		tweet = assigns(:tweet)
		assert_redirected_to tweet_path(tweet)
	end

	test "should get show" do
		login_as(:one)
		get :show, id: tweets(:one).id
		assert_response :success
	end

	test "should delete tweet" do
		login_as(:one)
		
		assert_difference('Tweet.count', -1) do
			delete :destroy, id: tweets(:one).id
		end

		assert_redirected_to new_tweet_path
	end

end
