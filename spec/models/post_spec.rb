# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation tests' do
    let(:post) { build(:post) }
    it 'has a valid factory' do
      expect(post).to be_valid
    end

    it 'ensures content presence' do
      post.content = nil
      expect(post.save).to eq(false)
    end

    it 'ensures date_post presence' do
      post.date_post = nil
      expect(post.save).to eq(false)
    end

    it 'should save succesfully' do
      expect(post.save).to eq(true)
    end
  end

  describe 'associations post tests' do
    it { is_expected.to belong_to(:user) }
    # it { is_expected.to have_many(:comments) }
    # it { is_expected.to have_many(:likes) }
  end
end
