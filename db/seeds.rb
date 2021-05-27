# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies = URI.open(url).read
movie_toprated = JSON.parse(movies)
p movie_toprated

# movie_toprated.each do |movie|
#   end

movie_toprated['results'].each do |movie_hash|
  Movie.create!(title: movie_hash['title'], overview: movie_hash['overview'], poster_url: "https://image.tmdb.org/t/p/original/#{movie_hash['poster_path']}", rating: movie_hash['vote_average'])
end
