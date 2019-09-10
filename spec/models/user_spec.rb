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

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    
    it "should validate presence_of_password_digest" do
      user = build(:user, password_digest: nil)
      user.valid?
      expect(user.errors[:password_digest]).to eq(["Password can't be blank."])
    end

    it "should validate length of password" do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to eq(["is too short (minimum is 6 characters)"])
    end

  end

  describe "associations" do
  end

  describe "class methods" do
    subject(:user) { create(:user) }

    describe "::find_by_credentials" do
      it "should find user by credentials" do
        email = user.email
        password = user.password
        find_user = User.find_by(email: email)
        expect(find_user).to eq(user)
        expect(user.is_password?(password)).to eq(true)
      end

      it "should fail to find user by invalid credentials" do
        email = user.email
        password = "pass"
        find_user = User.find_by(email: email)
        expect(find_user).to eq(user)
        expect(user.is_password?(password)).to eq(false)
      end
    end

    describe "#is_password?" do
      it "should confirm that password is correct" do
        expect(user.is_password?(user.password)).to eq(true)
      end

      it "should confirm that password is incorrect" do
        expect(user.is_password?("pass")).to eq(false)
      end
    end

    describe "#password=" do
      it "should set the password_digest" do
        user.password_digest = nil
        user.password=("passwords")
        expect(user.password_digest).to_not eq(nil)
      end
    end

    describe "reset_session_token" do
      it "should reset the session_token" do
        old_session_token = user.session_token
        expect(user.reset_session_token!).to_not eq(old_session_token)
        expect(user.reset_session_token!).to eq(user.session_token)
      end
    end

    describe "ensure_session_token" do
      it "should assign user a session_token" do
        user.session_token = nil
        user.reset_session_token!
        expect(user.session_token).to_not be_nil
      end
    end
  end
end
