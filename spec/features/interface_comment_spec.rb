# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Interface Comments', type: :feature do
  let(:user) { create(:user) }

  describe 'Interface Comments' do
    before(:each) do
      @post1 = user.posts.create(FactoryBot.attributes_for(:post))

      visit root_path
      within 'form' do
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
      end
    end

    scenario 'Creating a comment succesfully!' do
      expect do
        fill_in 'comment_content', with: 'This is the content of the comment!'
        click_button 'Comment'
        expect(page).to have_content 'Comment created successfully.'
        expect(page).to have_content 'This is the content of the comment!'
      end.to change(user.comments, :count).by(1)
    end

    # scenario "index comment with the User's comments and friend's comments" do
    #  expect(page).to have_content('Error')
    # end

    scenario 'Deleting a comment succesfully!' do
      expect do
        fill_in 'comment_content', with: 'This is the content of the comment!'
        click_button 'Comment'
        expect(page).to have_content 'Comment created successfully.'
        expect(page).to have_content 'This is the content of the comment!'
      end.to change(user.comments, :count).by(1)
      click_link 'Delete'
      expect(page).to have_content 'Comment deleted successfully'
      expect(page).to have_no_content 'This is the content of the comment!'
    end
  end
end
