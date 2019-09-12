# == Schema Information
#
# Table name: user_comments
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  comment_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserComment < ApplicationRecord
  validates :comment_id, :user_id, presence: true

  belongs_to :comment
  belongs_to :user

  def self.link_user_comment!(comment_id, user_id)
    user_comment = UserComment.new
    user_comment.comment_id = comment_id
    user_comment.user_id = user_id
    user_comment.save
  end

  private

    def user_comment_params
      params.require(:user_comment).permit(:comment_id, :user_id)
    end
end
