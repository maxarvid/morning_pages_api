describe 'POST themes/:id/morning_pages', type: :request do
  subject { response }
  let(:theme) { create(:theme) }
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }

  describe 'successfully' do
    before do
      post "/themes/#{theme.id}/morning_pages", params: { morning_page: { title: 'My awesome title', body: 'My thoughtful body' } },
                                                headers: credentials
    end

    it { is_expected.to have_http_status 201 }

    it 'is expected to respond with a message' do
      expect(response_json['message']).to eq 'The page was saved to the database'
    end

    it 'is expected to respond with the body of the morning page' do
      expect(response_json['morning_page']['body']).to eq 'My thoughtful body'
    end
  end

  describe 'unsuccessfully' do
    describe 'because of missing credentials' do
      before do
        post "/themes/#{theme.id}/morning_pages", params: { morning_page: { title: 'My awesome title', body: 'My thoughtful body' } },
                                                  headers: nil
      end

      it { is_expected.to have_http_status 401 }

      it 'is expected to respond with an error' do
        expect(response_json['errors'].first).to eq 'You need to sign in or sign up before continuing.'
      end
    end

    describe 'because of missing body' do
      before do
        post "/themes/#{theme.id}/morning_pages", params: { morning_page: { title: 'My awesome title', body: nil } },
                                                  headers: credentials
      end

      it { is_expected.to have_http_status 422 }

      it 'is expected to respond with an error' do
        expect(response_json['errors'].first).to eq "Body can't be blank"
      end
    end
  end
end
