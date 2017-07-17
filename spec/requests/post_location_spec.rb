require 'rails_helper'
describe 'add location', :type=>:request do

  before {
    post '/locations', params: { name: 'Seattle', latitude: 12.2, longitude: 12.4 }
  }

  it 'returns the location name' do
    expect(JSON.parse(response.body)['name']).to eq('Seattle')
  end

  it 'returns the location lat' do
    expect(JSON.parse(response.body)['latitude']).to eq(12.2)
  end

  it 'returns the location lng' do
    expect(JSON.parse(response.body)['longitude']).to eq(12.4)
  end

  it 'returns created status' do
    expect(response).to have_http_status(:created)
  end
end
