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



genres = %w(horror comedy drama suspense scifi fantasy action thriller)

genres.each do |g|
    Genre.create(name: g)
end

wilson = Writer.create(name: 'wilson', genre_id: Genre.find_by(name: 'scifi').id)
vince = Writer.create(name: 'Vince', genre_id: Genre.find_by(name: 'thriller').id)   
martin = Writer.create(name:'Martin', genre_id: Genre.find_by(name: 'action').id)
david = Writer.create(name: 'David', genre_id: Genre.find_by(name: 'action').id)


future = Title.create(
    name: 'back to the future',
    writer_id: wilson.id,
    description: 'Marty McFly goes back to the future and almost bangs his mom.',
    img: 'nilly'
    )

user = User.create(user_name: 'swag boi', password: 'boatsandhos')


Review.create(content: 'not enough mom banging', user: user, title: future, rating: 3)

el_camino = Title.create(
    name: 'El Camino', 
    writer_id: vince.id,
    description:'A Breaking Bad Movie that reunited fans with Jesse Pinkman'
    )

irish = Title.create(
    name: 'The Irishman', 
    writer_id: martin.id,
    description:'truck driver gets involved with a dangerous crime family'
    )


king = Title.create(
    name: 'The King',
    writer_id: david.id,
    description:'Young Henry V encounters deceit,war and treachery after becoming King Of England in the 15th century, in the aftermath of his brother death'
    )