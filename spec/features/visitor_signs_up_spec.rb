require 'spec_helper'

feature 'Visitor signs up' do

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Login')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Login')
  end

  def sign_up_with(email, password)
    visit new_user_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign me up!'
  end

end
