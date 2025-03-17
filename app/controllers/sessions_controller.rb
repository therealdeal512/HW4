class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id  # Store user ID in session
      redirect_to "/", notice: "Welcome back, #{user.username}!"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil  # Clear session (log out)
    redirect_to "/", notice: "Logged out successfully"
  end
end
