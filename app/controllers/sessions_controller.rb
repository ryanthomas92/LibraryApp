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
      redirect_to @user
    else
      redirect_to login_path
    end
  end
end
