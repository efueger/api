require 'spec_helper'

describe User do
  it { validate_presence_of :username }
  it { validate_uniqueness_of :username }
  it { validate_presence_of :password }
  it { validate_inclusion_of(:role).in_array(described_class::ROLES) }
  it { have_many :comments }
  it { have_many :posts }
  it { respond_to :role }
  it { respond_to :ROLES }

  let(:user) { FactoryGirl.create(:guest) }

  it 'is valid' do
    expect(user).to be_valid
  end

  describe 'role' do
    it 'is guest by default' do
      user = User.create(username: 'bleble', password: '123')
      expect(user.role).to eql 'guest'
      expect(user).to be_guest
    end

    it 'comes from array of defined ROLES' do
      expect(described_class::ROLES).to be_a Array
      expect(described_class::ROLES).to_not be_empty
    end

    it '#admin?' do
      expect(FactoryGirl.create(:admin)).to be_admin
    end
  end
end
