class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :get_friendships_notifications

  def get_friendships_notifications
  	if user_signed_in?
  		@friendships_notifications = Relationship.where(friendee_id: current_user.id, approved: nil)
  	end
  end 

end
