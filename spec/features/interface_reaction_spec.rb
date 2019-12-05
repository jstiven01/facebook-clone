# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Interface Reactions (Likes)', type: :feature do
  let(:user) { create(:user) }

  describe 'Interface Reactions (Likes)' do
    before(:each) do
      @post1 = user.posts.create(FactoryBot.attributes_for(:post))

      visit root_path
      within 'form' do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
      end
    end

    scenario 'Creating a reaction (Like it) succesfully!' do
      expect do
        click_link 'I like it'
        expect(page).to have_content '1 like'
      end.to change(user.reactions, :count).by(1)
    end

    scenario 'Deleting a reaction (Unlike) succesfully!' do
      expect do
        click_link 'I like it'
        expect(page).to have_content '1 like'
      end.to change(user.reactions, :count).by(1)

      expect do
        click_link 'Unlike'
        expect(page).to have_content '0 likes'
      end.to change(user.reactions, :count).by(-1)
    end
  end
end
