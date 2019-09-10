require 'rails_helper'
require 'spec_helper'

feature "the signup process" do

  scenario "has a sign up page" do
    visit new_user_url
    expect(page).to have_content 'Sign up'
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      create_user("test", "test@email.com", "password")
      expect(current_path).to eq("/users")
      expect(page).to have_content("test")
    end 

    scenario "with invalid params" do
      create_user("test", "test@email.com", "pass")
      expect(current_path).to eq("/users")
      expect(page).to have_content("Password is too short")
    end
  end
end

feature "logging in" do
    
  scenario 'shows username on the homepage after login' do
    create_user("test", "test@email.com", "password")
    login_user("test", "password")
    expect(current_path).to eq("/users/#{User.find_by(username: "test").id}")
    expect(page).to have_content("test")
  end

end

feature 'logging out' do

    scenario 'begins with a logged out state' do
      create_user("test", "test@email.com", "password")
      visit new_session_url
      expect(page).to have_content("Sign in")
      expect(page).to_not have_content("Sign out")
    end

    scenario 'doesn\'t show \'welcome\' on homepage after logout' do
      create_user("test", "test@email.com", "password")
      login_user("test", "password")
      click_on "Log out"
      expect(current_path).to eq(new_session_path)
      expect(page).to_not have_content('Welcome')
    end
end