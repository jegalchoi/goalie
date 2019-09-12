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

require 'rails_helper'

RSpec.describe GoalComment, type: :model do
end
