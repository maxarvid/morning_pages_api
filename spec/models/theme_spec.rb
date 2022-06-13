RSpec.describe Theme, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
  end

  describe 'Associations' do
    it { is_expected.to have_many :morning_pages }
  end

  describe 'FactoryBot' do
    it 'is expected to have a valid Factory' do
      expect(create(:theme)).to be_valid
    end
  end
end
