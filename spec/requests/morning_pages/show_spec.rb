describe 'GET /morning_pages/:id', type: :request do
  let(:morning_page) { create(:morning_page) }
  subject { response }

  before do
    get "/morning_pages/#{morning_page.id}"
  end

  it { is_expected.to have_http_status 200 }

  it 'is expected to return the body of the morning page' do
    expect(response_json['morning_page']).to eq morning_page.body
  end
end
