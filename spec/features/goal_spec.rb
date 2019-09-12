require 'rails_helper'
require 'spec_helper'

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