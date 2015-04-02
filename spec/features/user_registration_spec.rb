require 'rails_helper'

describe 'Registering a user' do
  it 'registers a new user' do
    visit root_path
    click_on 'Sign up'
    fill_in 'Email', with: 'dude@dudemail.com'
    fill_in 'Name', with: 'Dude'
    fill_in 'Number', with: '1234567890'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'You have signed up successfully.'
  end

  it "edits a user's account" do
    user = FactoryGirl.create(:user)
    sign_in(user)
    click_on 'Edit profile'
    fill_in 'Email', with: 'editdude@dudemail.com'
    fill_in 'Name', with: 'Edited Dude'
    fill_in 'Number', with: '0987654321'
    fill_in 'Current password', with: user.password
    click_button 'Update'
    expect(page).to have_content 'Updated.'
  end

  it 'deletes a user\'s account' do
    user = FactoryGirl.create(:user)
    sign_in(user)
    click_on 'Edit profile'
    click_button 'Delete my account'
    expect(page). to have_content "successfully cancelled"
  end
end
