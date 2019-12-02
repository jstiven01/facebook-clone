# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User sign up', type: :feature do
  describe 'User sign up cases' do
    before(:each) do
      visit root_path
      click_link 'Sign up'
      within 'form' do
        fill_in 'First name', with: 'William'
        fill_in 'Last name', with: 'Shakespeare'
        fill_in 'Email', with: 'kingLear@tragedy.com'
        fill_in 'Password', with: 'aaa111'
        fill_in 'Password confirmation', with: 'aaa111'
      end
    end

    scenario 'User signs up successfully' do
      click_button 'Sign up'
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'User does not fill first name' do
      within 'form' do
        fill_in 'First name', with: ''
        click_button 'Sign up'
      end
      expect(page).to have_content("First name can't be blank")
    end

    scenario 'User does not fill Last name' do
      within 'form' do
        fill_in 'Last name', with: ''
        click_button 'Sign up'
      end
      expect(page).to have_content("Last name can't be blank")
    end
  end
end
