class User < ActiveRecord::Base
	validates :username, :email, presence: true, uniqueness: true
	has_secure_password validations: true

	has_many :tweets
end
