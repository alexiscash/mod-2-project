# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'rest-client'
# require 'json'

Genre.destroy_all
Writer.destroy_all
Title.destroy_all
User.destroy_all
Review.destroy_all

# api_key = '6e28a3f2'
# url = "http://www.omdbapi.com/?apikey=#{api_key}&t=Avengers: Endgame&y=2019"
# response = RestClient.get(url, header={})
# response = JSON.parse(response)

api_key = '6e28a3f2'
url = "http://www.omdbapi.com/?apikey=#{api_key}&t=Avengers: Endgame&y=2019"
response = JSON.parse(RestClient.get(url, header={}))



genres = %w(horror comedy drama suspense scifi fantasy action)

genres.each do |g|
    Genre.create(name: g)
end

wilson = Writer.create(name: 'wilson', genre_id: Genre.find_by(name: 'scifi').id)
    


future = Title.create(
    name: 'back to the future',
    writer_id: wilson.id,
    description: 'Marty McFly goes back to the future and almost bangs his mom.',
    img: 'nilly'
    )

user = User.create(user_name: 'swag boi', password: 'boatsandhos')

Review.create(content: 'not enough mom banging', user: user, title: future, rating: 3)

