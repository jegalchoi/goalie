# == Schema Information
#
# Table name: comments
#
#  id             :bigint           not null, primary key
#  body           :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_type :string
#  imageable_id   :bigint
#

class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :imageable, polymorphic: true
end
