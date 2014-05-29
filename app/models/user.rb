class User < ActiveRecord::Base

	validates :username, presence: true
	validates :name, presence: true
	validates :email, presence: true
	has_secure_password
end
