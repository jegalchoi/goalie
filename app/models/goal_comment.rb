# == Schema Information
#
# Table name: goal_comments
#
#  id         :bigint           not null, primary key
#  comment_id :integer          not null
#  goal_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GoalComment < ApplicationRecord
  validates :comment_id, :goal_id, presence: true

  belongs_to :comment
  belongs_to :goal

  def self.link_goal_comment!(comment_id, goal_id)
    goal_comment = GoalComment.new
    goal_comment.comment_id = comment_id
    goal_comment.goal_id = goal_id
    goal_comment.save
  end
end
