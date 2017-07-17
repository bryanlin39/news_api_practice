require 'rails_helper'
describe 'show one location data', :type=>:request do

  before {
    @location = FactoryGirl.create(:location)
    @article = FactoryGirl.create(:article)
    @location.articles.push(@article)
    get '/locations/'+@location.id.to_s
  }

  it 'returns location data' do
    expect(JSON.parse(response.body)['name']).to eq(@location.name)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
