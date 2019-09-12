class CommentsController < ApplicationController
  def create
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @comment = @user.comments.new(comment_params)

      if @comment.save
        flash[:success] = "Comment saved!"
        redirect_to user_url(@user)
      else
        flash.now[:errors] = @comment.errors.full_messages
        redirect_to user_url(@user)
      end
    else
      @goal = Goal.find_by(id: params[:goal_id])
      @comment = @goal.comments.new(comment_params)

      if @comment.save
        flash[:success] = "Comment saved!"
        redirect_to goal_url(@goal)
      else
        flash.now[:errors] = @comment.errors.full_messages
        redirect_to goal_url(@goal)
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
