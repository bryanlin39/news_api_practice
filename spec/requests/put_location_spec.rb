require 'rails_helper'
describe 'update location', :type=>:request do

  before {
    @location = FactoryGirl.create(:location)
    @article = FactoryGirl.create(:article)
    @location.articles.push(@article)
    put '/locations/'+@location.id.to_s+'?name=Seattle'
  }

  it 'returns the location name' do
    expect(JSON.parse(response.body)['name']).to eq('Seattle')
  end

  it 'returns created status' do
    expect(response).to have_http_status(:accepted)
  end
end
