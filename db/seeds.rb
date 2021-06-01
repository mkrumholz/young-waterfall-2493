# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all
Actor.destroy_all
Studio.destroy_all

@studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

@movie_1 = @studio.movies.create!(title:'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure') 
@movie_2 = @studio.movies.create!(title:'Jurassic Park', creation_year: 1993, genre: 'Action/Adventure') 
@movie_3 = @studio.movies.create!(title:'Minions', creation_year: 2015, genre: 'Family Comedy') 
@movie_4 = @studio.movies.create!(title:'Shrek', creation_year: 2001, genre: 'Family Comedy') 
@movie_5 = @studio.movies.create!(title:'Back to the Future', creation_year: 1985, genre: 'Sci-Fi') 

@actor_1 = @movie_1.actors.create!(name: 'Harrison Ford', age: 78, currently_working: false)
@actor_2 = @movie_2.actors.create!(name: 'Laura Dern', age: 54, currently_working: true)
@actor_3 = @movie_2.actors.create!(name: 'Samuel L. Jackson', age: 72, currently_working: true)
@actor_4 = @movie_5.actors.create!(name: 'Christopher Lloyd', age: 82, currently_working: true)
@actor_5 = @movie_5.actors.create!(name: 'Lea Thompson', age: 60, currently_working: true)
@actor_6 = @movie_5.actors.create!(name: 'Michael J. Fox', age: 59, currently_working: false)
@actor_7 = @movie_5.actors.create!(name: 'Claudia Wells', age: 54, currently_working: true)

@movie_2.actors << @actor_4