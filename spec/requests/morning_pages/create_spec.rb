describe 'POST /morning_pages', type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }

  describe 'successfully' do
    before do
      post '/morning_pages', params: { morning_page: { title: 'My awesome title', body: 'My thoughtful body' } },
                             headers: credentials
    end

    it { is_expected.to have_http_status 201 }

    it 'is expected to respond with a message' do
      expect(response_json['message']).to eq 'The page was saved to the database'
    end
    
  end
end
