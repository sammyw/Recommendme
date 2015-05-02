class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: [:admin]

  def home
  end

  def admin
  end

  def contact
  end

end
