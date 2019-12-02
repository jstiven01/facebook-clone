require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation tests' do
    let(:comment) { build(:comment) }
    it 'has a valid factory' do
      expect(comment).to be_valid
    end

    it 'ensures content presence' do
      comment.content = nil
      expect(comment.save).to eq(false)
    end

    it 'ensures date_comment presence' do
      comment.date_comment = nil
      expect(comment.save).to eq(false)
    end

    it 'should save succesfully' do
      expect(comment.save).to eq(true)
    end
  end

  describe 'associations comment tests' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
    # it { is_expected.to have_many(:likes) }
    # it { is_expected.to have_many(:likes) }
  end
end
