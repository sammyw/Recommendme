class LocationUser < ActiveRecord::Base
  belongs_to :location
  belongs_to :user

  # create validation for uniqueness of user and location
  validates :user, uniqueness: { scope: :location }

end
