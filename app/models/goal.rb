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

  validates :title, presence: true
  validates :user_id, presence: true
  validates :details, presence: true
end
