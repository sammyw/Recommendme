class Tip < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :plan_tips
  has_many :plans, through: :plan_tips
end