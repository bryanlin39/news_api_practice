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
      puts location.name
    end
  end

  User.destroy_all
  User.create(name: 'bugs', email: 'bugs@rubyplus.com', password: '123456')
  User.create(name: 'daffy', email: 'daffy@rubyplus.com', password: '123456')

end

Seed.begin
