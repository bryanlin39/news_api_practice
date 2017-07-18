class News
  def self.get_news(location)
    location.articles.each do |article|
      article.destroy
    end
    
    response = RestClient::Request.execute(
    method: :get,
    url: 'https://newsapi.org/v1/articles?source=the-next-web&apiKey='+ENV['NEWS_API_KEY'],
    )
    JSON.parse(response)['articles'].each do |article|
      location.articles.create(
        url: article['url'],
        title: article['title'],
        body: article['description']
      )
    end
  end
end
