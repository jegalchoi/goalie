class UsersController < ApplicationController
  before_action :require_user!, only: [:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      flash[:success] = "You have successfully signed up!"
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    find_user
    @user.destroy
    redirect_to new_user_url
  end

  def show
    find_user
    if @user
      render :show
    else
      render :new
    end
  end

  private

    def find_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :session_token)
    end
end
