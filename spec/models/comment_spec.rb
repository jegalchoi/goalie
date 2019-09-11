# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { build(:comment) }

  describe 'validations' do
    it { should validate_presence_of(:body) }
  end

  describe 'associations' do
  end
end
