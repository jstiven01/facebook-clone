require 'rails_helper'

RSpec.describe Reaction, type: :model do
  context 'validation tests' do
    let(:reaction) { build(:reaction) }
    it 'has a valid factory' do
      expect(reaction).to be_valid
    end

    it 'should save succesfully' do
      expect(reaction.save).to eq(true)
    end
  end

  describe 'associations reaction tests' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end
end
