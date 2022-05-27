require "json"
require "open-uri"

url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)["results"]

p movies

movies.each do |movie|
  entry = Movie.create(
    title: movie["original_title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500" + "#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
  puts "Creating movie with id #{entry.id}"
end

puts "Finished seeding database!"
