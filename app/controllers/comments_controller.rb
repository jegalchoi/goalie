class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      if request.referer.include?("user")
        @comment.link_user(@comment.id, params[:user_id])
      else
        @comment.link_goal(@comment.id, params[:goal_id])
      end
      flash[:success] = "Comment saved!"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:errors] = @comment.errors.full_messages
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
