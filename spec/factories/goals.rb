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

FactoryBot.define do
  factory :goal do
    user_id { 1 }
    title { Faker::Lorem.sentence }
    details { Faker::Lorem.words }
  end
end