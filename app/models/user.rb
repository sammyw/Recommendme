class User < ActiveRecord::Base
	has_one :account
	has_many :plans
	has_many :location_users
	has_many :locations, through: :location_users
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
