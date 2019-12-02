# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Interface User', type: :feature do
  let(:user) { create(:user) }

  describe 'Interface Users cases' do
    before(:each) do
      @post1 = user.posts.create(FactoryBot.attributes_for(:post))
      @post2 = user.posts.create(FactoryBot.attributes_for(:post))
      @post3 = user.posts.create(FactoryBot.attributes_for(:post))
      visit root_path
      within 'form' do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
      end
    end

    scenario 'Showing personal info' do
      click_link 'My Profile'
      expect(page).to have_content(user.full_name)
      expect(page).to have_content(user.email)
    end
  end
end
