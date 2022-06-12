RSpec.describe MorningPage, type: :model do
  describe 'DB Table' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:body).of_type(:text) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :body }
  end

  describe 'FactoryBot' do
    it 'is expected to have a valid Factory' do
      expect(create(:morning_page)).to be_valid
    end
  end
end
