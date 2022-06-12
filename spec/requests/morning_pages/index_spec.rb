RSpec.describe 'GET /morning_pages', type: :request do
  subject { response }
  let!(:morning_pages) { create_list(:morning_page, 3) }
  
  before do
    get '/morning_pages'
  end

  it { is_expected.to have_http_status 200 }

  it 'is expected to return all the morning pages' do
    expect(response_json['morning_pages'].count).to eq 3
  end
end
