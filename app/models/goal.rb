# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  details    :text             not null
#  visibility :boolean          default(TRUE), not null
#  status     :boolean          default(FALSE), not null
#  cheers     :integer          default(0), not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ApplicationRecord
  belongs_to :user
  #has_many :goal_comments,
  #  class_name: 'GoalComment',
  #  foreign_key: :goal_id,
  #  primary_key: :id
  #has_many :comments,
  #  through: :goal_comments
  has_many :comments, as: :imageable

  validates :title, presence: true
  validates :user_id, presence: true
  validates :details, presence: true
end
