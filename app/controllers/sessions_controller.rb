class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    #confirm email and password combo is right
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Successfully logged in!"      # <-- Add into flash in appropriate application.html.erb page
      redirect_to @user
    else
      flash[:error] = "Incorrect email or password!"  # <-- Add into flash in appropriate application.html.erb page
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:notice] = "Successfully logged out!"       # <-- Add into flash in appropriate application.html.erb page
    redirect_to root_path
  end

end
