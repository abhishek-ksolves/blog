# users_spec.rb
require 'rails_helper'

RSpec.feature "User Features", type: :feature do
  context 'create new user' do
    before(:each) do
      visit '/users/sign_up'
      within("form") do
      end
    end

    scenario "should be successful" do
      within("form") do
        fill_in 'Email', with: 'john@gmail.com'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
      end
      click_button 'Sign up'
      expect(page).to have_content 'You have signed up successfully.'
    end

    scenario "should fail" do
      click_button 'Sign up'
      expect(page).to have_content 'Email can\'t be blank'
    end
  end
end
