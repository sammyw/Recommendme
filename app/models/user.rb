class User < ActiveRecord::Base
	has_one :account
	has_many :plans
	has_many :location_users
	has_many :locations, through: :location_users
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

end
