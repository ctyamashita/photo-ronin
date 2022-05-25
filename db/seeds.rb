# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
require "open-uri"

IMAGE_URLS = ['https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2036', 'https://images.unsplash.com/photo-1544885935-98dd03b09034?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687', 'https://images.unsplash.com/photo-1536768139911-e290a59011e4?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735', 'https://images.unsplash.com/photo-1508333706533-1ab43ecb1606?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887']

# seed all 7 models
puts "creating seeds"
Review.destroy_all
Photo.destroy_all
Marker.destroy_all
List.destroy_all
User.destroy_all
Place.destroy_all

8.times do
  Place.create!(
    name: Faker::Address.community,
    address: ['Tokyo', 'Kyoto', 'Saitama', 'Yokohama', 'Kawasaki'].sample
    # latitude: Faker::Address.latitude,
    # longitude: Faker::Address.longitude
  )
end

User.create!(name: 'Ronin1', email: 'photo@ronin.com', password: 'password', instagram_url: 'instagram.com')
2.times do
  user = User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.email,
    password: 'password',
    instagram_url: 'instagram_url'
  )

  5.times do
    list = List.create!(
      title: Faker::Address.city,
      user: user
    )
    2.times do
      place = 0
      Marker.create!(
        list: list,
        place: Place.all[place]
      )
      place + 1
    end
  end

  5.times do
    photograph = Photo.create!(
      user: user,
      place: Place.all.sample
    )
    file = URI.open(IMAGE_URLS.sample)
    photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')
  end

  5.times do
    Review.create!(
      content: Faker::Camera.brand_with_model,
      rating: rand(1..5),
      user: user,
      place: Place.all.sample
    )
  end
end
puts "seeds created"
