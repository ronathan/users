require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get new session" do
  	get :new
  	assert_response :success
  end

  test "should logout session" do
  	get :logout
  	assert_redirected_to login_path
  	assert_equal nil, session[:user_id]
  end

  test "should create new session" do
  	post :create, user: { email: users(:one).email, password_digest: users(:one).password_digest }
  	assert_equal session[:user_id], users(:one).id
  	assert_redirected_to user_path(users(:one))
  end

  test "should NOT create new session with invalid parameters" do
  	post :create, user: { email: 'foo', password_digest: 'bar' }
  	assert_redirected_to login_path
  	assert_equal "Invalid Login.", flash[:error]
  end
end
