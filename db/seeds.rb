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
ActsAsTaggableOn::Tag.destroy_all


# syntax for tag gem
city_tag = ActsAsTaggableOn::Tag.create!(name: 'City')
nature_tag = ActsAsTaggableOn::Tag.create!(name: 'Nature')
modern_tag = ActsAsTaggableOn::Tag.create!(name: 'Modern')
traditional_tag = ActsAsTaggableOn::Tag.create!(name: 'Traditional')
landscape_tag = ActsAsTaggableOn::Tag.create!(name: 'Landscape')
portrait_tag = ActsAsTaggableOn::Tag.create!(name: 'Portrait')

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

User.create!(name: 'Ronin1', email: 'photo@ronin.com', password: 'password', instagram_url: 'instagram.com')

User.create!(name: 'Celso Yamashita', email: 'celso@camp.com', password: '123123', instagram_url: 'instagram.com', admin: true)

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
    # counter = 1
    # 2.times do
    #   Marker.create!(
    #     list: list,
    #     place: Place.all[counter]
    #   )
    #   counter + 1
    # end
  end

    5.times do
    Review.create!(
      content: Faker::Camera.brand_with_model,
      rating: rand(3..5),
      user: user,
      place: Place.all.sample
    )
  end
end

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


# syntax for tag gem
# ActsAsTaggableOn::Tag.create!(name: 'Urban')
# ActsAsTaggableOn::Tag.create!(name: 'Nature')
# ActsAsTaggableOn::Tag.create!(name: 'Modern')
# ActsAsTaggableOn::Tag.create!(name: 'Traditional')
# ActsAsTaggableOn::Tag.create!(name: 'Landscape')
# ActsAsTaggableOn::Tag.create!(name: 'Portrait')


puts "seeds created"
