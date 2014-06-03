class List < ActiveRecord::Base
	validates_presence_of :name

	has_many :products
	belongs_to :user
end
