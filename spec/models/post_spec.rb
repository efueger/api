require 'spec_helper'

describe Post do
  it { validate_presence_of :content }
  it { validate_presence_of :title }
  it { validate_presence_of :creator }
  it { belong_to(:creator).with_foreign_key('user_id') }
  it { have_many :comments }

  describe 'when create' do
    before(:each) { @post = FactoryGirl.create(:post) }

    it 'is valid' do
      expect(@post).to be_valid
    end

    it 'has like counter eql 0 by default' do
      expect(@post.like_counter).to be_zero
    end
  end

  it 'can increase like counter' do
    post = FactoryGirl.create(:post)
    expect {
      post.like
    }.to change { post.like_counter }.by(1)
  end
end
