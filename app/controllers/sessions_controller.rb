class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.authenticate(params[:username])
    if @user
      flash[:notice] = "You have logged in!"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem logging you in."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out successfully."
    redirect_to "/"
  end
end
