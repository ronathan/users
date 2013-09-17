require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  test "tweets cannot be empty" do 
  	tweet = Tweet.new(content: "")
  	assert tweet.invalid?
  	assert tweet.errors[:content].any?
  end

  test "tweets cannot have more than 140 char" do
  	hi = "hi"
  	tweet = Tweet.new(content: hi * 140)
  	assert tweet.invalid?
  	assert tweet.errors[:content].any?
  end

  test "tweets has a user id associated with it" do
  	tweet = tweets(:one)
  	tweet.user = users(:one)
  	assert tweet.user
  end
end
