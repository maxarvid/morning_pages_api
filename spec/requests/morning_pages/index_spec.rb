RSpec.describe 'GET /morning_pages', type: :request do
  subject { response }
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let!(:morning_pages) { create_list(:morning_page, 3, user: user) }
  let!(:other_morning_pages) { create_list(:morning_page, 3) }

  describe 'when user is authenticated' do
    before do
      get '/morning_pages', headers: credentials
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to return all the morning pages belonging to the user' do
      expect(response_json['morning_pages'].count).to eq 3
    end
  end

  describe 'when user is not authenticated' do
    before do
      get '/morning_pages'
    end

    it { is_expected.to have_http_status 401 }

    it 'is expecter to return an error message' do
      expect(response_json['errors'].first).to eq 'You need to sign in or sign up before continuing.'
    end
  end
end
