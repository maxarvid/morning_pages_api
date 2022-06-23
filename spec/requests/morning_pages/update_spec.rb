describe 'PUT themes/:id/morning_pages/:id', type: :request do
  subject { response }
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:morning_page) { create(:morning_page, user: user) }

  describe 'successfully' do
    before do
      put "/themes/#{morning_page.theme.id}/morning_pages/#{morning_page.id}",
          params: { morning_page: { title: 'This is an updated Title',
                                    body: 'This is an updated body' } },
          headers: credentials
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to respond with the updated resource' do
      expect(response_json['morning_page']['title']).to eq 'This is an updated Title'
    end

    it 'is expected to respond with a message' do
      expect(response_json['message']).to eq "This is an updated Title has been updated"
    end
    
  end

  describe 'unsuccessfully' do
    describe 'because of missing credentials' do
      before do
        put "/themes/#{morning_page.theme.id}/morning_pages/#{morning_page.id}",
            params: { morning_page: { title: 'This is an updated Title', body: 'This is an updated body' } },
            headers: nil
      end

      it { is_expected.to have_http_status 401 }

      it 'is expected to respond with an error' do
        expect(response_json['errors'].first).to eq 'You need to sign in or sign up before continuing.'
      end
    end

    describe 'because the resource cannot be found' do
      before do
        put "/themes/#{morning_page.theme.id}/morning_pages/999",
            params: { morning_page: { title: 'This is an updated Title', body: 'This is an updated body' } },
            headers: credentials
      end

      it { is_expected.to have_http_status 404 }

      it 'is expected to respond with an error message' do
        expect(response_json['errors'].first).to eq 'Morning page not found'
      end
    end

    describe 'because morning page validations are not met' do
      before do
        put "/themes/#{morning_page.theme.id}/morning_pages/#{morning_page.id}",
            params: { morning_page: { title: 'This is an updated Title', body: nil } },
            headers: credentials
      end

      it { is_expected.to have_http_status 422 }

      it 'is expected to respond with the updated resource' do
        expect(response_json['errors'].first).to eq "Body can't be blank"
      end
    end
  end
end
