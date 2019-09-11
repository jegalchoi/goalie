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

require 'rails_helper'

RSpec.describe Goal, type: :model do
  subject(:goal) { build(:goal) }

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:details) }

    it "should validate presence of user_id" do
      goal = build(:goal, user_id: nil)
      goal.valid?
      expect(goal.errors[:user_id]).to eq(["can't be blank"])
    end

  end

  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "class methods" do

  end
end