class User < ActiveRecord::Base

	validates :username, presence: true
	validates :name, presence: true
	validates :email, presence: true
	has_secure_password
	validates :my_email_attribute, :email => true
end
