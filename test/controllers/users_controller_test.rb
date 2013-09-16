require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
  	get :index
  	assert_response :success
  end

  test "should get new" do
  	get :new
  	assert_response :success
  end

  test "should create new user" do
  	attributes = valid_user_attributes
  	assert_difference('User.count') do
  		post :create, user: attributes
  	end
  	assert_redirected_to login_path
  end

  test "should get edit" do
  	get :edit, id: users(:one).id
  	assert_response :success
  end

  test "should update user" do
  	user = users(:two)
  	attributes = valid_user_attributes
  	patch :update, id: user.id, user: attributes
  	assert_redirected_to user_path(users(:two))
  end

  test "should get show" do
  	get :show, id: users(:one)
  	assert_response :success
  end

  test "should delete user" do
  	assert_difference('User.count', -1) do
  		delete :destroy, id: users(:one)
  	end
  	assert_redirected_to new_user_path
  end

  def valid_user_attributes
  	user = users(:one)
  	attributes = user.attributes.except("id")
  	attributes[:password] = "password"
  	attributes[:password_confirmation] = "password"

  	user.destroy!

  	raise unless User.new(attributes).valid?

  	return attributes
  end
end
