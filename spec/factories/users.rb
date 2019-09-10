# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :user do
    pw = Faker::Internet.password
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { pw }
    session_token { SecureRandom.urlsafe_base64(16) }
    password_digest { BCrypt::Password.create(pw) }
  end
end
