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
  scenario "has a log in page" do
    visit new_session_url
    expect(page).to have_button 'Submit'
  end
    
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

feature 'create goal' do
  scenario 'shows link to create a goal on the user\'s page' do
    create_user("test", "test@email.com", "password")
    login_user("test", "password")
    expect(page).to have_content("New Goal")
  end

  scenario 'shows page to create goal after clicking link' do
    create_user("test", "test@email.com", "password")
    login_user("test", "password")
    click_on "New Goal"
    expect(current_path).to eq(new_goal_path)
    expect(page).to have_content('New Goal')
  end

  scenario 'shows goal on user\'s page after creating goal' do
    create_user("test", "test@email.com", "password")
    login_user("test", "password")
    click_on "New Goal"
    fill_in "Title", with: "newgoal"
    fill_in "Details", with: "testtest"
    click_on "New Goal"
    expect(page).to have_content('Goal saved!')
    expect(page).to have_content('newgoal')
  end
end

feature 'edit goal' do
  scenario 'change goal to completed from user page' do
    create_user("test", "test@email.com", "password")
    login_user("test", "password")
    click_on "New Goal"
    fill_in "Title", with: "test"
    fill_in "Details", with: "testtest"
    click_on "New Goal"
    click_on "Log out"
    login_user("test", "password")
    click_on "Complete"
    expect(page).to have_button('Oops! Did not complete.')
  end

  scenario 'change goal to completed from goal page' do
    create_user("test", "test@email.com", "password")
    login_user("test", "password")
    click_on "New Goal"
    fill_in "Title", with: "test"
    fill_in "Details", with: "testtest"
    click_on "New Goal"
    click_on "Complete"
    expect(page).to have_button('Oops! Did not complete.')
  end
end

feature 'delete goal' do
  scenario 'goal is no longer on user\'s profile' do
    create_user("test", "test@email.com", "password")
    login_user("test", "password")
    click_on "New Goal"
    fill_in "Title", with: "newgoal"
    fill_in "Details", with: "testtest"
    click_on "New Goal"
    click_on "Log out"
    login_user("test", "password")
    click_on "delete newgoal goal"
    expect(page).to_not have_button('delete newgoal goal')
    expect(page).to_not have_content('newgoal')
  end
end