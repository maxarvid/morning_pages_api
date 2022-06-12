RSpec.describe User, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many :morning_page }
  end

  describe 'FactoryBot' do
    it 'is expected to have a valid Factory' do
      expect(create(:user)).to be_valid
    end
  end
end
