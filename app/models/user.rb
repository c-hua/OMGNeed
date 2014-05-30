class User < ActiveRecord::Base

	# validates :username, presence: true
	validates :name, :email, :username, presence: true
	# validates :email, presence: true

	validates :password, length: {minimum: 6}
	validates :email, uniqueness: true

	has_secure_password
end
