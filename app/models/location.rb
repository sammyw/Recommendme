class Location < ActiveRecord::Base
	has_many :location_users
	has_many :users, through: :location_users
	has_many :tips
	validates :country, presence: true

	def self.find_location(country, city, region)
		location = find_by('city = ? AND country = ?', city, country)
		if location
			location
		else
			create(city: city, country: country)
		end
	end

	def self.search(search)
 if search
   self.where('name like ?', "%#{search}%")
 else
   self.all
 end
end

end
