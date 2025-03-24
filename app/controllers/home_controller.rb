class HomeController < ApplicationController
  def index
    if session[:user_id]
      redirect_to places_path
    end
  end
end
