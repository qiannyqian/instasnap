module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit new_user_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Sign me up!'
    end

    def sign_in
      user = create(:user)
      visit new_sessions_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log me in!'
    end
  end
end
