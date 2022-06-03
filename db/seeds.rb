# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require "faker"
require "open-uri"

# IMAGE_URLS = ['https://images.unsplash.com/photo-1536098561742-ca998e48cbcc?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2036', 'https://images.unsplash.com/photo-1544885935-98dd03b09034?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687', 'https://images.unsplash.com/photo-1536768139911-e290a59011e4?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735', 'https://images.unsplash.com/photo-1508333706533-1ab43ecb1606?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887']

random_places_images = ['https://images.unsplash.com/photo-1586165877141-3dbcfc059283?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80', 'https://images.unsplash.com/photo-1601042879364-f3947d3f9c16?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', 'https://images.unsplash.com/photo-1534214526114-0ea4d47b04f2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', 'https://images.unsplash.com/photo-1573455494060-c5595004fb6c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1440&q=80', 'https://images.unsplash.com/photo-1493515322954-4fa727e97985?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', 'https://images.unsplash.com/photo-1618397806621-290788301ced?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', 'https://images.unsplash.com/photo-1604928141064-207cea6f571f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1228&q=80', 'https://images.unsplash.com/photo-1604604994333-f1b0e9471186?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1936&q=80', 'https://images.unsplash.com/photo-1596713109885-c94bdfd7f19d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80', 'https://images.unsplash.com/photo-1582546338780-c9889634b3d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80', 'https://images.unsplash.com/photo-1498036882173-b41c28a8ba34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80', 'https://images.unsplash.com/photo-1535913917396-518c020c6a1f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80', 'https://images.unsplash.com/photo-1528360983277-13d401cdc186?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', 'https://images.unsplash.com/photo-1559255394-d92ddc3250e5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80', 'https://images.unsplash.com/photo-1501769752-a59efa2298ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80']
# 10 reflection
reflection_images = %w(https://i.postimg.cc/fRVdnWzc/2-B1-ADD50-4-FA9-468-F-814-F-69-FBB7873-CE9.jpg https://images.unsplash.com/photo-1512580726450-29e80f95fba8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80 https://images.unsplash.com/photo-1534351455006-415f235f0dbe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80 https://images.unsplash.com/photo-1621389133054-202d9ce749e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80 https://images.unsplash.com/photo-1624618008148-2ab204b1b414?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1375&q=80 https://images.unsplash.com/photo-1635243553791-d570233af040?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80 https://images.unsplash.com/photo-1635243914895-83611bbe3ea9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1706&q=80 https://images.unsplash.com/photo-1630540780510-2a30ee4156ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=906&q=80 https://images.unsplash.com/photo-1490855894936-79de3ac55bd8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80 https://images.unsplash.com/photo-1648534740928-f40c995ef07a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80)
# 6 industrila
industrial_images = %w(https://images.unsplash.com/photo-1542340412-d0484732166e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80 https://images.unsplash.com/photo-1648615046285-ad8e3b11c7a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=673&q=80 https://images.unsplash.com/photo-1510876821828-ee7f646821e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80 https://images.unsplash.com/photo-1600810837398-cbab17e90d0c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80 https://images.unsplash.com/photo-1546421602-13ac9c4857c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80 https://images.unsplash.com/photo-1526142805342-8c7badb164e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80)
# 8 facade
facade_wall_images = %w(https://images.unsplash.com/photo-1516207661925-8baf004a3619?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1389&q=80 https://images.unsplash.com/photo-1512678186248-0f7f54e77027?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80 https://images.unsplash.com/photo-1520434788163-6a92efe3aed7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80 https://images.unsplash.com/photo-1488984255023-366a9062e35c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1474&q=80 https://images.unsplash.com/photo-1606492661931-bd900212eada?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1496&q=80 https://images.unsplash.com/photo-1480796927426-f609979314bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80 https://images.unsplash.com/photo-1517142099008-c2eb9227b575?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1510&q=80 https://images.unsplash.com/photo-1480911620066-b6ccd99c48f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1460&q=80)
# 5 rooftop
rooftop_images = %w(https://www.therooftopguide.com/rooftop-bars-in-tokyo/Bilder/TwoRoomsGrillandBar_6_slide.jpg https://s3-ap-northeast-1.amazonaws.com/thegate/2021/11/08/17/32/23/tokyo%20tower-night%20veiw.jpeg https://teemusphoto.com/wp-content/uploads/2017/03/DSC06908.jpg https://cdn-ak.f.st-hatena.com/images/fotolife/R/RECO/20170820/20170820214556.jpg https://i.postimg.cc/xjGqWJKD/67-B8-EBB4-9-CCD-421-A-BD79-6-BC1631-AFD3-C.jpg)
# 5 alley
old_alley_images = %w(https://i.postimg.cc/8C715q8V/4-EA1-A02-C-1-BFB-4-FE8-AE7-D-EDDC41-AFCB2-C.jpg https://kinarino.k-img.com/system/press_images/000/420/094/f920bef262268a17d3b9b6dc0a4d87b2ef5ac220.jpg?1436954693.jpg https://d3jks39y9qw246.cloudfront.net/medium/12601/c4de17b0a13ca531ef4202e19369594b79eca1c2.png https://www.viewtabi.jp/wp-content/uploads/2019/07/article_main_19071701.jpg https://www.pakutaso.com/shared/img/thumb/HIRO_20140126-P1010471_TP_V4.jpg)
reviews_content = ["Great place for wide shots!", "Tripod recommended for long exposure.", "Afternoon is the best moment to shoot.", "Amazing place for environmental portrait.", "You might spend long hours here, bring extra batteries.", "Bring your nifty-fifty."]

# seed all 7 models
puts "cleaning the db"
Review.destroy_all
puts "reviews deleted"
Photo.destroy_all
puts "photos deleted"
Marker.destroy_all
puts "markers deleted"
List.destroy_all
puts "list deleted"
User.destroy_all
puts "users deleted"
Place.destroy_all
puts "places deleted"
ActsAsTaggableOn::Tag.destroy_all
puts "tags deleted"

# users
puts 'creating users'
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
  file = URI.open("https://source.unsplash.com/random/?portrait")
  user.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

  1.times do
    List.create!(
      title: Faker::Address.city,
      user: user
    )
  end
end
# syntax for tag gem
# city_tag = ActsAsTaggableOn::Tag.create!(name: 'City')
# nature_tag = ActsAsTaggableOn::Tag.create!(name: 'Nature')
# modern_tag = ActsAsTaggableOn::Tag.create!(name: 'Modern')
# traditional_tag = ActsAsTaggableOn::Tag.create!(name: 'Traditional')
# landscape_tag = ActsAsTaggableOn::Tag.create!(name: 'Landscape')
# portrait_tag = ActsAsTaggableOn::Tag.create!(name: 'Portrait')
# tags = [city_tag, nature_tag, modern_tag, traditional_tag, landscape_tag, portrait_tag]

# 6/2 new tag
reflection_tag = ActsAsTaggableOn::Tag.create!(name: 'Reflection')
industrial_tag = ActsAsTaggableOn::Tag.create!(name: 'Industrial')
facade_wall_tag = ActsAsTaggableOn::Tag.create!(name: 'Facade Wall')
rooftop_tag = ActsAsTaggableOn::Tag.create!(name: 'Rooftop')
old_alley_tag = ActsAsTaggableOn::Tag.create!(name: 'Old Alley')
# long_exposure = ActsAsTaggableOn::Tag.create!(name: 'Long Exposure')
# night_view_tag = ActsAsTaggableOn::Tag.create!(name: 'Night View')
# cherry_blossom_tag = ActsAsTaggableOn::Tag.create!(name: 'Cherry Blossom')
# red_leaves_tag = ActsAsTaggableOn::Tag.create!(name: 'Red Leaves')
# tags = [industrial_tag, reflection_tag, old_alley_tag, rooftop_tag, graphite_wall_tag, cherry_blossom_tag, red_leaves_tag]

addresses = ["Ginza 1-chome", "Shibuya 3-chome", "Nakameguro 2-1-12", "Okachimachi 5-chome-23", "Ueno 4-chome", "Ikebukuro 3-12-1", "Shinjuku 3-chome", "Asagayakita 20-2-1", "Gayenmae 2-23-1", "Shinagawa 4-chome", "Shirokane", "Takadonababa"]
industrial_name = ["Destroyed wall", "Big warehouse", "Abandoned factory", "Shipyard", "Port area", "Back lot"]
reflection_name = ["Lake reflection", "Rain night", "Mirrors", "Reflections", "Shopping window"]
facade_wall_name = ["Painting wall", "Shop curtain", "Station sign"]
rooftop_name = ["Night rooftop", "Neon rooftop", "Daytime rooftop"]
old_alley_name = ["Neon alley", "Cobblestones alley", "Izakaya alley"]
random = ['Street', 'City', 'People', 'Lights', 'Urban', 'Tokyo']

# random places
# below tokyo area
puts 'created 20 random places'
20.times do
  place = Place.create!(
    name: random.sample,
    address: "#{rand(1..3)}-chōme-#{rand(1..5)}-#{rand(1..30)}",
    longitude: rand(139.392955..139.616137),
    latitude: rand(35.339647..35.637597)
  )

  image = Photo.create!(
    user: User.all.sample,
    place: place,
    longitude: rand((place.longitude-0.005)..(place.longitude+0.001)),
    latitude: rand((place.latitude-0.001)..(place.latitude+0.008))
  )

  url = 'https://source.unsplash.com/400x400/?urban,japan'
  file = URI.open(url)
  image.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

  print '.'
end

# tokyo area
puts 'created 50 random pin places'
30.times do
  place = Place.create!(
    name: random.sample,
    address: "#{rand(1..3)}-chōme-#{rand(1..5)}-#{rand(1..30)}",
    longitude: rand(139.360763..139.92477),
    latitude: rand(35.664660..35.90220)
  )

  image = Photo.create!(
    user: User.all.sample,
    place: place,
    longitude: rand((place.longitude-0.005)..(place.longitude+0.001)),
    latitude: rand((place.latitude-0.001)..(place.latitude+0.008))
  )

  url = 'https://source.unsplash.com/400x400/?urban,japan'
  file = URI.open(url)
  image.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

  print '.'
end

# tokyo area

# reflection
puts 'created 5 real places'
5.times do
  place = Place.create!(
    name: reflection_name.sample,
    address: addresses.sample,
    longitude: rand(139.360763..139.92477),
    latitude: rand(35.664660..35.90220),
    tag_list: reflection_tag,
  )
  2.times do
    image = Photo.create!(
      user: User.all.sample,
      place: place,
      longitude: rand((place.longitude-0.005)..(place.longitude+0.001)),
      latitude: rand((place.latitude-0.001)..(place.latitude+0.008)),
    )
    url = reflection_images.sample
    file = URI.open(url)
    reflection_images.delete(url)
    image.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')
    Review.create!(
      user: User.all.sample,
      place: place,
      rating: rand(3..5),
      content: reviews_content.sample
    )
  end
  print '.'
end

# industrial
puts 'created 3 places'
3.times do
  place = Place.create!(
    name: industrial_name.sample,
    address: addresses.sample,
    longitude: rand(139.360763..139.92477),
    latitude: rand(35.664660..35.90220),
    tag_list: industrial_tag,
  )
  2.times do
    image = Photo.create!(
      user: User.all.sample,
      place: place,
      longitude: rand((place.longitude-0.005)..(place.longitude+0.001)),
      latitude: rand((place.latitude-0.001)..(place.latitude+0.008)),
    )
    url = industrial_images.sample
    file = URI.open(url)
    industrial_images.delete(url)
    image.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')
    Review.create!(
      user: User.all.sample,
      place: place,
      rating: rand(3..5),
      content: reviews_content.sample
    )
  end
  print '.'
end
# industrial_images.each do |img|
#   Photo.new(
#     user: User.all.sample,
#     # place: place,
#     longitude: rand((place.longitude-0.005)..(place.longitude+0.001)),
#     latitude: rand((place.latitude-0.001)..(place.latitude+0.008)),
#   )
#   file = URI.open(img)
#   image.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')
# end
# Photo.first(2)


# Facade/Wall
puts 'created 4 places'
4.times do
  place = Place.create!(
    name: facade_wall_name.sample,
    address: addresses.sample,
    longitude: rand(139.360763..139.92477),
    latitude: rand(35.664660..35.90220),
    tag_list: facade_wall_tag,
  )
  2.times do
    image = Photo.create!(
      user: User.all.sample,
      place: place,
      longitude: rand((place.longitude-0.005)..(place.longitude+0.001)),
      latitude: rand((place.latitude-0.001)..(place.latitude+0.008)),
    )
    url = facade_wall_images.sample
    file = URI.open(url)
    facade_wall_images.delete(url)
    image.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')
    Review.create!(
      user: User.all.sample,
      place: place,
      rating: rand(3..5),
      content: reviews_content.sample
    )
  end
  print '.'
end


#  rooftop
puts 'created 5 places'
5.times do
  place = Place.create!(
    name: rooftop_name.sample,
    address: addresses.sample,
    longitude: rand(139.360763..139.92477),
    latitude: rand(35.664660..35.90220),
    tag_list: rooftop_tag,
  )
  image = Photo.create!(
    user: User.all.sample,
    place: place,
    longitude: rand((place.longitude-0.005)..(place.longitude+0.001)),
    latitude: rand((place.latitude-0.001)..(place.latitude+0.008)),
  )
  url = rooftop_images.sample
  file = URI.open(url)
  rooftop_images.delete(url)
  image.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')
  Review.create!(
    user: User.all.sample,
    place: place,
    rating: rand(3..5),
    content: reviews_content.sample
  )
  print '.'
end

# #  old alley
puts 'created 5 places'
5.times do
  place = Place.create!(
    name: old_alley_name.sample,
    address: addresses.sample,
    longitude: rand(139.360763..139.92477),
    latitude: rand(35.664660..35.90220),
    tag_list: old_alley_tag,
  )
  image = Photo.create!(
    user: User.all.sample,
    place: place,
    longitude: rand((place.longitude-0.005)..(place.longitude+0.001)),
    latitude: rand((place.latitude-0.001)..(place.latitude+0.008)),
  )
  url = old_alley_images.sample
  file = URI.open(url)
  old_alley_images.delete(url)
  image.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')
  Review.create!(
    user: User.all.sample,
    place: place,
    rating: rand(3..5),
    content: reviews_content.sample
  )
  print '.'
end

# area below tokyo

# 15.times do
#   place = Place.create!(
#     name: 'test_name',
#     address: 'test_addy',
#     longitude: rand(139.392955..139.616137),
#     latitude: rand(35.339647..35.637597),
#     tag_list: tags.sample(2)
#   )
#   image = Photo.create!(
#     user: User.all.sample,
#     place: place
#   )
#   file = URI.open(random_places_images.sample)
#   image.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')
# end


# # hidden places
# gotokuji = Place.create!(name: 'Gotokuji', address: 'Nakamachi, Setagaya', tag_list: [nature_tag, traditional_tag])
# omoide_yokocho = Place.create!(name: 'Omoide Yokocho', address: 'Nishishinjuku, Shinjuku', tag_list: [traditional_tag, city_tag])
# tokyu_plaza = Place.create!(name: 'Tokyu Plaza Omotesando', address: 'Jingumae, Shibuya', tag_list: [city_tag, portrait_tag])
# underground_temple = Place.create!(name: 'Underground Temple', address: 'Kasukabe, Saitama', tag_list: [city_tag])

# # trending places
# shibuya_crossing = Place.create!(name: 'Shibuya Crossing', address: 'Dogenzaka, Shibuya', tag_list: [city_tag, portrait_tag])
# skytree = Place.create!(name: 'Skytree', address: 'Oshiage, Sumida', tag_list: [city_tag, modern_tag])
# kabukicho = Place.create!(name: 'Kabukicho', address: 'Kabukicho, Shinjuku', tag_list: [city_tag, modern_tag])
# rainbow_bridge = Place.create!(name: 'Rainbow Bridge', address: 'Minato City, Tokyo', tag_list: [city_tag, landscape_tag])

# # ----------------------------------------------------------------------------------------------------------------------

# # ----------------------------------------------------------------------------------------------------------------------
# # hidden places
# photograph = Photo.create!(
#   user: User.all.sample,
#   place: gotokuji
# )
# photograph.cached_votes_total = rand(50..500)
# photograph.save
# file = URI.open('https://s3-ap-northeast-1.amazonaws.com/thegate/2019/06/14/10/33/03/Gotokuji-temple-maneki-neko-offering-area.jpeg')
# photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

# photograph = Photo.create!(
#   user: User.all.sample,
#   place: omoide_yokocho
# )
# photograph.cached_votes_total = rand(50..500)
# photograph.save
# file = URI.open('https://static.wixstatic.com/media/c92124_b847a2ec2be14b0bb5f10b25ced8c93d~mv2.jpg/v1/fill/w_1000,h_625,al_c,q_90,usm_0.66_1.00_0.01/c92124_b847a2ec2be14b0bb5f10b25ced8c93d~mv2.jpg')
# photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

# photograph = Photo.create!(
#   user: User.all.sample,
#   place: tokyu_plaza
# )
# photograph.cached_votes_total = rand(50..500)
# photograph.save
# file = URI.open('https://i.pinimg.com/736x/cf/af/de/cfafde42ae4e88825b8efd5323d40cca.jpg')
# photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

# photograph = Photo.create!(
#   user: User.all.sample,
#   place: underground_temple
# )
# photograph.cached_votes_total = rand(50..500)
# photograph.save
# file = URI.open('http://cdn.theatlantic.com/assets/media/img/photo/2015/05/scenes-from-underground/g03_468889108/main_1200.jpg')
# photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

# # ----------------------------------------------------------------------------------------------------------------------
# # trending places
# photograph = Photo.create!(
#   user: User.all.sample,
#   place: shibuya_crossing
# )
# photograph.cached_votes_total = rand(50..500)
# photograph.save
# file = URI.open('https://tz-mag-media.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2019/07/20192118/12.jpg')
# photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

# photograph = Photo.create!(
#   user: User.all.sample,
#   place: skytree
# )
# photograph.cached_votes_total = rand(50..500)
# photograph.save
# file = URI.open('https://live.staticflickr.com/7853/46843750984_84ce4d8f64_b.jpg')
# photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

# photograph = Photo.create!(
#   user: User.all.sample,
#   place: kabukicho
# )
# photograph.cached_votes_total = rand(50..500)
# photograph.save
# file = URI.open('https://i.pinimg.com/originals/6f/d8/18/6fd818c25cc70ebbff8b95e0bceca5b1.jpg')
# photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

# photograph = Photo.create!(
#   user: User.all.sample,
#   place: rainbow_bridge
# )
# photograph.cached_votes_total = rand(50..500)
# photograph.save
# file = URI.open('https://blog.japanwondertravel.com/wp-content/uploads/2020/09/Rainbow-bridge-tokyo-1200x800.jpg')
# photograph.photo.attach(io: file, filename: 'filename.jpg', content_type: 'image/jpg')

# # ----------------------------------------------------------------------------------------------------------------------
# # reviews
# User.all.each do |user|
#   5.times do
#     Review.create!(
#       content: Faker::Camera.brand_with_model,
#       rating: rand(3..5),
#       user: user,
#       place: Place.all.sample
#     )
#   end
# end
puts "seeds created"
