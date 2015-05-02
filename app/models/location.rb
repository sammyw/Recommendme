class Location < ActiveRecord::Base
	has_many :location_users
	has_many :users, through: :location_users
	has_many :tips
	validates :country, presence: true
end
