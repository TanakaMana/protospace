require 'rails_helper'

feature 'User management' do
  scenario 'Sign up' do
    user = build(:user)
    visit root_path
    click_on 'Get Started'
    click_on 'Sign up now'
    fill_in 'Username', with: user.name
    fill_in 'E-Mail', with: user.email
    fill_in 'Password', with: user.password
    click_on 'save'
    expect(current_path).to eq root_path
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'Sign in and posting a new prototype' do
    user = build(:user)
    prototype = build(:prototype)
    visit root_path
    click_on 'Get Started'
    fill_in 'Email address', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sing in'
    visit new_prototype_path
    fill_in 'title', with: prototype.title
    attach_file 'prototype[thumbnails_attributes][0][image]', "#{Rails.root}/spec/fixtures/img/sample.jpg", visible: false
    fill_in 'Catch Copy', with: prototype.catchcopy
    fill_in 'Concept', with: prototype.concept
    click_on 'Publish'
    expect(page).to have_content 'Your prototype was successfully posted'
  end
end
