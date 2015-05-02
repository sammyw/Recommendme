class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :plan_tips
  has_many :tips, through: :plan_tips
  validates :name, presence: true
end
