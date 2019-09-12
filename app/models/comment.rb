# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates :body, presence: true

  def link_user(comment_id, user_id)
    UserComment.link_user_comment!(comment_id, user_id)
  end

  def link_goal(comment_id, goal_id)
    GoalComment.link_goal_comment!(comment_id, goal_id)
  end
end
