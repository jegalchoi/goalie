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
  subject(:goal_comment) { build(:goal_comment) }

  describe 'validations' do
    it { should validate_presence_of(:comment_id) }
    it { should validate_presence_of(:goal_id) }
  end

  describe 'associations' do
    it { should belong_to(:comment) }
    it { should belong_to(:goal) }
  end
end
