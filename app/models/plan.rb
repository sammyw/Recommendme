class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :plan_tips
  has_many :tips, through: :plan_tips
  validates :name, presence: true
  validate :start_date_in_future, :end_date_later_than_start_date 

  def start_date_in_future
  	if start_date < Date.today
  		errors.add(:start_date, "Start date must be in the future")
  	end
  end

  def end_date_later_than_start_date
  	if end_date < start_date
  		errors.add(:end_date, "End date must be later than start date")
  	end
  end

  def self.future
    where('start_date > ?', Date.today)
  end

   def self.current
    where('start_date <= ? AND end_date >= ?', Date.today, Date.today)
  end

  def self.past
    where('end_date <= ?', Date.today)
  end

end
