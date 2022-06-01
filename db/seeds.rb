# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require "faker"
require "open-uri"

IMAGE_URLS = ['https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2036', 'https://images.unsplash.com/photo-1544885935-98dd03b09034?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687', 'https://images.unsplash.com/photo-1536768139911-e290a59011e4?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735', 'https://images.unsplash.com/photo-1508333706533-1ab43ecb1606?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887']

random_places_images = ['https://images.unsplash.com/photo-1586165877141-3dbcfc059283?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80', 'https://images.unsplash.com/photo-1601042879364-f3947d3f9c16?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', 'https://images.unsplash.com/photo-1534214526114-0ea4d47b04f2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', 'https://images.unsplash.com/photo-1573455494060-c5595004fb6c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1440&q=80', 'https://images.unsplash.com/photo-1493515322954-4fa727e97985?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', 'https://images.unsplash.com/photo-1618397806621-290788301ced?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', 'https://images.unsplash.com/photo-1604928141064-207cea6f571f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1228&q=80', 'https://images.unsplash.com/photo-1604604994333-f1b0e9471186?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1936&q=80', 'https://images.unsplash.com/photo-1596713109885-c94bdfd7f19d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', 'https://images.unsplash.com/photo-1582546338780-c9889634b3d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80', 'https://images.unsplash.com/photo-1498036882173-b41c28a8ba34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80', 'https://images.unsplash.com/photo-1535913917396-518c020c6a1f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80', 'https://images.unsplash.com/photo-1528360983277-13d401cdc186?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', 'https://images.unsplash.com/photo-1559255394-d92ddc3250e5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80', 'https://images.unsplash.com/photo-1501769752-a59efa2298ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80']

# seed all 7 models
puts "creating seeds"
Review.destroy_all
Photo.destroy_all
Marker.destroy_all
List.destroy_all
User.destroy_all
Place.destroy_all
ActsAsTaggableOn::Tag.destroy_all

# users
User.create!(name: 'Ronin1', email: 'photo@ronin.com', password: 'password', instagram_url: 'instagram.com/jharimo')
User.create!(name: 'Celso Yamashita', email: 'celso@camp.com', password: '123123', instagram_url: 'instagram.com', admin: true)
User.create!(name: 'Shinji', email: 'shinji@gmail.com', password: '123123', instagram_url: 'instagram.com/paintitblack8', admin: true)

20.times do
  user = User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.email,
    password: 'password',
    instagram_url: 'instagram_url'
  )

  1.times do
    List.create!(
      title: Faker::Address.city,
      user: user
    )
  end
end
# syntax for tag gem
city_tag = ActsAsTaggableOn::Tag.create!(name: 'City')
nature_tag = ActsAsTaggableOn::Tag.create!(name: 'Nature')
modern_tag = ActsAsTaggableOn::Tag.create!(name: 'Modern')
traditional_tag = ActsAsTaggableOn::Tag.create!(name: 'Traditional')
landscape_tag = ActsAsTaggableOn::Tag.create!(name: 'Landscape')
portrait_tag = ActsAsTaggableOn::Tag.create!(name: 'Portrait')
tags = [city_tag, nature_tag, modern_tag, traditional_tag, landscape_tag, portrait_tag]

# random places
# tokyo area
50.times do
  place = Place.create!(
    name: 'test_name',
    address: 'test_addy',
    longitude: rand(139.360763..139.92477),
    latitude: rand(35.664660..35.90220),
    tag_list: tags.sample(2)
  )
  image = Photo.create!(
    user: User.all.sample,
    place: place
  )
  file = URI.open(random_places_images.sample)
  image.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')
end
puts 'created 50 places'

# area below tokyo
15.times do
  place = Place.create!(
    name: 'test_name',
    address: 'test_addy',
    longitude: rand(139.392955..139.616137),
    latitude: rand(35.339647..35.637597),
    tag_list: tags.sample(2)
  )
  image = Photo.create!(
    user: User.all.sample,
    place: place
  )
  file = URI.open(random_places_images.sample)
  image.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')
end
puts 'created 15 places'

# hidden places
gotokuji = Place.create!(name: 'Gotokuji', address: 'Nakamachi, Setagaya', tag_list: [nature_tag, traditional_tag])
omoide_yokocho = Place.create!(name: 'Omoide Yokocho', address: 'Nishishinjuku, Shinjuku', tag_list: [traditional_tag, city_tag])
tokyu_plaza = Place.create!(name: 'Tokyu Plaza Omotesando', address: 'Jingumae, Shibuya', tag_list: [city_tag, portrait_tag])
underground_temple = Place.create!(name: 'Underground Temple', address: 'Kasukabe, Saitama', tag_list: [city_tag])

# trending places
shibuya_crossing = Place.create!(name: 'Shibuya Crossing', address: 'Dogenzaka, Shibuya', tag_list: [city_tag, portrait_tag])
skytree = Place.create!(name: 'Skytree', address: 'Oshiage, Sumida', tag_list: [city_tag, modern_tag])
kabukicho = Place.create!(name: 'Kabukicho', address: 'Kabukicho, Shinjuku', tag_list: [city_tag, modern_tag])
rainbow_bridge = Place.create!(name: 'Rainbow Bridge', address: 'Minato City, Tokyo', tag_list: [city_tag, landscape_tag])

# ----------------------------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------------------------------------------
# hidden places
photograph = Photo.create!(
  user: User.all.sample,
  place: gotokuji
)
file = URI.open('https://s3-ap-northeast-1.amazonaws.com/thegate/2019/06/14/10/33/03/Gotokuji-temple-maneki-neko-offering-area.jpeg')
photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

photograph = Photo.create!(
  user: User.all.sample,
  place: omoide_yokocho
)
file = URI.open('https://static.wixstatic.com/media/c92124_b847a2ec2be14b0bb5f10b25ced8c93d~mv2.jpg/v1/fill/w_1000,h_625,al_c,q_90,usm_0.66_1.00_0.01/c92124_b847a2ec2be14b0bb5f10b25ced8c93d~mv2.jpg')
photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

photograph = Photo.create!(
  user: User.all.sample,
  place: tokyu_plaza
)
file = URI.open('https://i.pinimg.com/736x/cf/af/de/cfafde42ae4e88825b8efd5323d40cca.jpg')
photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

photograph = Photo.create!(
  user: User.all.sample,
  place: underground_temple
)
file = URI.open('http://cdn.theatlantic.com/assets/media/img/photo/2015/05/scenes-from-underground/g03_468889108/main_1200.jpg')
photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

# ----------------------------------------------------------------------------------------------------------------------
# trending places
photograph = Photo.create!(
  user: User.all.sample,
  place: shibuya_crossing
)
file = URI.open('https://tz-mag-media.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2019/07/20192118/12.jpg')
photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

photograph = Photo.create!(
  user: User.all.sample,
  place: skytree
)
file = URI.open('https://live.staticflickr.com/7853/46843750984_84ce4d8f64_b.jpg')
photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

photograph = Photo.create!(
  user: User.all.sample,
  place: kabukicho
)
file = URI.open('https://i.pinimg.com/originals/6f/d8/18/6fd818c25cc70ebbff8b95e0bceca5b1.jpg')
photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

photograph = Photo.create!(
  user: User.all.sample,
  place: rainbow_bridge
)
file = URI.open('https://blog.japanwondertravel.com/wp-content/uploads/2020/09/Rainbow-bridge-tokyo-1200x800.jpg')
photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

# ----------------------------------------------------------------------------------------------------------------------
# reviews
User.all.each do |user|
  5.times do
    Review.create!(
      content: Faker::Camera.brand_with_model,
      rating: rand(3..5),
      user: user,
      place: Place.all.sample
    )
  end
end
puts "seeds created"
