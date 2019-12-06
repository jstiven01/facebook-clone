# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reaction, type: :model do
  context 'validation tests' do
    let(:reaction) { build(:reaction) }
    let(:reaction2) { build(:reaction) }
    it 'has a valid factory' do
      expect(reaction).to be_valid
    end

    it 'should save succesfully' do
      expect(reaction.save).to eq(true)
    end

    it 'should NOT be valid when there are user_id and post_id duplicated' do
      reaction.user_id = 1
      reaction.post_id = 2
      reaction2.user_id = 1
      reaction2.post_id = 2
      reaction.save
      expect(reaction2.save).to eq(false)
    end
  end

  describe 'associations reaction tests' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end
end
