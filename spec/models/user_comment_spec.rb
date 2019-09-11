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

require 'rails_helper'

RSpec.describe UserComment, type: :model do
  subject(:user_comment) { build(:user_comment)}

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:comment_id) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:comment) }
  end
end
