require 'rails_helper'

describe 'adding a user' do
  it 'adds a new user' do
    visit new_user_path
    fill_in 'Username', with: 'dude'
    fill_in 'Email', with: 'dude@dude.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_on 'Create User'
    expect(page).to have_content "You've succesfully registered."
  end
end

describe 'login' do
  it 'logs user in' do
    user= FactoryGirl.create(:user)
    visit '/'
    click_on 'Login'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'password'
    click_button 'Login'
    expect(page).to have_content ''
  end
end
