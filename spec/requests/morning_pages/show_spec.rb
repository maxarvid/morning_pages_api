describe 'GET /morning_pages/:id', type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:morning_page) { create(:morning_page) }
  subject { response }

  describe 'when user is authenticated' do
    before do
      get "/morning_pages/#{morning_page.id}", headers: credentials
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to return the body of the morning page' do
      expect(response_json['morning_page']['body']).to eq morning_page.body
    end
  end

  describe 'when user is not authenticated' do
    before do
      get "/morning_pages/#{morning_page.id}", headers: nil
    end

    it { is_expected.to have_http_status 401 }

    it 'is expected to return an error message' do
      expect(response_json['errors'].first).to eq 'You need to sign in or sign up before continuing.'
    end
  end
end
