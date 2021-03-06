<h1 align="center">Photo Ronin 📷</h1>

<p align="center">Discover new places to take your photos</p>

<a href="https://photo-ronin.herokuapp.com/"><img src="https://github.com/ctyamashita/photo-ronin/blob/main/app/assets/images/og_photo.jpg"/></a>
- <p>Click on the image above to checkout the web app! ☝</p>

<img src="https://github.com/ctyamashita/photo-ronin/blob/main/app/assets/images/ronin-screenshots.png" />
 
<br>

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variable.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
MAPBOX_API_KEY=your_own_mapbox_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 6](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Team Members
- [Celso Takeshi Yamashita](https://www.linkedin.com/in/ctyamashita/)
- [Hakuyo Harimoto](https://www.linkedin.com/in/hakuyo-harimoto-32338b123/)
- [Nana Kadode](https://www.linkedin.com/in/nana-kadode/)
- [Shinji Momoi](https://www.linkedin.com/in/shinjimomoi/)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License
