require 'rails_helper'
require 'spec_helper'

feature 'create user comment' do
  scenario 'comment is saved on user\'s profile' do
    create_user("test", "test@email.com", "password")
    login_user("test", "password")
    fill_in "Comment", with: "smelly"
    click_on "Save Comment"
    expect(page).to have_content("Comment saved!")
    expect(page).to have_content("smelly")
  end
end

feature 'create goal comment' do
  scenario 'comment is saved on goal\'s page' do
    create_user("test", "test@email.com", "password")
    login_user("test", "password")
    click_on "New Goal"
    fill_in "Title", with: "newgoal"
    fill_in "Details", with: "testtest"
    click_on "New Goal"
    fill_in "Comment", with: "smelly"
    click_on "Save Comment"
    expect(page).to have_content("Comment saved!")
    expect(page).to have_content("smelly")
  end
end
