class GoalsController < ApplicationController
  before_action :require_owner!, only: [:destroy, :update, :user_update]
  before_action :require_user!, only: [:create]

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id ||= current_user.id

    if @goal.save
      flash[:success] = "Goal saved!"
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      redirect_to user_url(@goal.user_id)
    end
  end

  def destroy
    find_goal
    @goal.destroy
    flash[:success] = "Goal deleted!"
    redirect_to user_url(@goal.user_id)
  end

  def show
    find_goal

    if @goal
      render :show
    else
      redirect_to new_goal_url
    end
  end

  def update
    find_goal

    if @goal.update_attributes(goal_params)
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      redirect_to goal_url(params[:id])
    end
  end

  def user_update
    find_goal

    if @goal.update_attributes(goal_params)
      redirect_to user_url(@goal.user_id)
    else
      flash.now[:errors] = @goal.errors.full_messages
      redirect_to user_url(@goal.user_id)
    end
  end

  private

    def goal_params
      params.require(:goal).permit(:title, :details, :visibility, :status, :cheers, :user_id)
    end

    def find_goal
      @goal = Goal.find_by(id: params[:id])
    end

end