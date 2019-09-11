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

FactoryBot.define do
  factory :goal_comment do
    comment_id { 1 }
    goal_id { 1 }
  end
end
