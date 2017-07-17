require 'rails_helper'
describe 'deletes one location', :type=>:request do
  before {
    @location = FactoryGirl.create(:location)
    @article = FactoryGirl.create(:article)
    @location.articles.push(@article)
    delete '/locations/'+@location.id.to_s
  }

  it 'returns delete confirmation' do
    expect(JSON.parse(response.body)['message']).to eq('Location has been deleted.')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
