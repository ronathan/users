require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user attributes cannot be blank" do
  	user = User.new()
  	assert user.invalid?
  	assert user.errors[:username].any?
  	assert user.errors[:email].any?
  end

  test "username must be unique" do
  	user = User.new(username: users(:one).username)
  	assert user.invalid?
  	assert user.errors[:username].any?
  end

  test "email must be unique" do
  	user = User.new(email: users(:one).email)
  	assert user.invalid?
  	assert user.errors[:email].any?
  end

  test "passwords must match" do
  	user = User.new(username: "Ronathan", email: "ronald.victorino@gmail.com", password: "password", password_confirmation: "notmatchingpassword")
  	assert user.invalid?
  end

end
