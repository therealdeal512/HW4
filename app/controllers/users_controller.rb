class UsersController < ApplicationController
  def new
    @user = User.new  # 👈 Ensure @user is initialized
  end

  def create
    puts params.inspect  # Debugging: Show what is being received

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id  # Log the user in
      redirect_to "/", notice: "Welcome, #{@user.username}!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end


