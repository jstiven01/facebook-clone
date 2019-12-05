# frozen_string_literal: true

require 'rails_helper'
#
# RSpec.describe 'Interface Friendship', type: :feature do
#   let(:user) { create(:user) }
#   let(:friend) { create(:user) }
#
#   describe 'Interface Friendship' do
#     before(:each) do
#       sign_in user
#       visit root_path
#       within 'form' do
#         fill_in 'Email', with: user.email
#         fill_in 'Password', with: user.password
#         click_button 'Log in'
#       end
#     end
#
#     scenario 'Creating a friendship succesfully!' do
#       expect do
#         fill_in 'post_content', with: 'This is the content of the friendship!'
#         click_button 'Publish'
#         expect(page).to have_content 'Post created successfully.'
#         expect(page).to have_content 'This is the content of the friendship!'
#       end.to change(user.friendships, :count).by(1)
#     end
#
#     scenario "index friendship with the User's friendship" do
#       expect(page).to have_content(@post1.content)
#       expect(page).to have_content(@post2.content)
#       expect(page).to have_content(@post3.content)
#     end
#
#     # scenario "index friendship with the User's friendships and friend's friendships" do
#     #  expect(page).to have_content('Error')
#     # end
#
#     scenario 'editing friendships' do
#       click_link 'My Profile'
#       within "#friendship-#{@post1.id}" do
#         click_link 'Edit Post'
#       end
#       expect(page).to have_current_path(edit_post_path(@post1))
#     end
#   end
# end
