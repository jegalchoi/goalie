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
end
