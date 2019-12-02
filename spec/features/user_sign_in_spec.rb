# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User sign in', type: :feature do
  let(:user) { create(:user) }
  describe 'User sign in cases' do
    before(:each) do
      visit root_path
      within 'form' do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
      end
    end

    scenario 'User signs in successfully' do
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end

    scenario 'User that is not registered' do
      within 'form' do
        fill_in 'Email', with: 'usernoregistered@example.com'
        click_button 'Log in'
      end
      expect(page).to have_content('Invalid Email or password.')
    end
  end
end
