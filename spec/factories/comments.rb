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

FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.sentence }
  end
end
