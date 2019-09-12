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

class UserComment < ApplicationRecord
end
