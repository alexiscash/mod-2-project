# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.destroy_all
Writer.destroy_all
Title.destroy_all
User.destroy_all
Review.destroy_all

api_key = '6e28a3f2'

genres = %w(horror comedy drama suspense scifi fantasy action)

genres.each do |g|
    Genre.create(name: g)
end

wilson = Writer.create(name: 'wilson', genre_id: Genre.find_by(name: 'scifi').id)
    

future = Title.create(
    name: 'back to the future',
    writer_id: wilson.id,
    description: 'Marty McFly goes back to the future and almost bangs his mom.',
    quote: 'Whoa Mom! Get that out of there.',
    character: 'Marty McFly'
    )

user = User.create(user_name: 'swag boi', password: 'boatsandhos')

Review.create(content: 'not enough mom banging', user: user, title: future, rating: 3)

