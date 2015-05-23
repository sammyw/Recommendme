class Relationship < ActiveRecord::Base
	belongs_to :friender, class_name: "User"
	belongs_to :friendee, class_name: "User"
	validates :friender_id, :friendee_id, presence: true

end
