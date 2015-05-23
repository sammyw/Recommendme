class User < ActiveRecord::Base
	has_one :account
	has_many :plans
	has_many :location_users
	has_many :locations, through: :location_users

	has_many :relationships, foreign_key: "friender_id", dependent: :destroy
	has_many :friendes, through: :relationships

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.email = auth.info.email
	    user.password = Devise.friendly_token[0,20]
	    user.save
	    user.account = Account.create(name: auth.info.name, picture: auth.info.image)
	  end
	end

	def friendee?(other_user)
		relationships.find_by(friender_id: other_user.id)
	end

	def friender?(other_user)
		relationships.find_by(friendee_id: other_user.id)
	end

	def request_friendship!(other_user)
		relationships.create!(friendee_id: other_user.id)
	end

	def cancel_friendship!(other_user)
		relationships.find_by(friendee_id: other_user.id).delete
	end

end
