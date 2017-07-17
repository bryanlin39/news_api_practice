class Seed

  def self.begin
    seed = Seed.new
    seed.generate_locations
  end

  def generate_locations
    10.times do
      location = Location.create!(
        name: Faker::Address.city,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude
      )
      3.times do
        location.articles.create!(
          url: Faker::Internet.url,
          title: Faker::Lorem.sentence,
          body: Faker::Lorem.paragraph
        )
      end
      puts location.name
    end
  end
end

Seed.begin
