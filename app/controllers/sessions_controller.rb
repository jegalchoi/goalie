class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password])
      
    if user.nil?
      flash.now[:errors] = "Incorrect email and/or password."
      render :new
    else
      login!(user)
      flash[:success] = "Welcome #{user.username}"
      redirect_to user_url(user)
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
