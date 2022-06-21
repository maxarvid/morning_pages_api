describe 'DELETE /morning_pages/:id', type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:morning_page) { create(:morning_page, user: user) }

  subject { response }

  describe 'successfully' do
    before do
      delete "/morning_pages/#{morning_page.id}", headers: credentials
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to respond with the title of the deleted resource' do
      expect(response_json['morning_page']['title']).to eq morning_page.title
    end
  end

  describe 'unsuccessfully' do
    describe 'because the user is not authenticated' do
      before do
        delete "/morning_pages/#{morning_page.id}", headers: nil
      end

      it { is_expected.to have_http_status 401 }

      it 'is expected to respond with an error' do
        expect(response_json['errors'].first).to eq 'You need to sign in or sign up before continuing.'
      end
    end

    describe 'because the resource cannot be found' do
      before do
        delete '/morning_pages/99999', headers: credentials
      end

      it { is_expected.to have_http_status 404 }

      it 'is expected to respond with an error' do
        expect(response_json['errors'].first).to eq 'Morning page not found'
      end
    end
  end
end
