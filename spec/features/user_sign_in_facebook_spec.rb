# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User sign in with Facebook', type: :feature do
  it 'can sign in user with Facebook account' do
    visit root_path
    expect(page).to have_content('Sign in with Facebook')
    mock_auth_hash
    click_link 'Sign in with Facebook'
    expect(page).to have_content('Successfully authenticated from Facebook account')
  end
end
