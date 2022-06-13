describe 'GET /themes' do
  subject { response }

  before do
    get '/themes'
  end

  it { is_expected.to have_http_status 200 }

  it 'is expected to return all the themes' do
    expect(response_json['themes'].count).to eq 3
  end
end
