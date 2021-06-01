require 'rails_helper'

RSpec.describe 'The movie show page' do
  before :each do
    @studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

    @movie_1 = @studio.movies.create!(title:'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure') 
    @movie_2 = @studio.movies.create!(title:'Jurassic Park', creation_year: 1993, genre: 'Action/Adventure') 
    @movie_3 = @studio.movies.create!(title:'Back to the Future', creation_year: 1985, genre: 'Sci-Fi') 

    @actor_1 = @movie_1.actors.create!(name: 'Harrison Ford', age: 78, currently_working: false)
    @actor_2 = @movie_2.actors.create!(name: 'Samuel L. Jackson', age: 72, currently_working: true)
    @actor_3 = @movie_3.actors.create!(name: 'Christopher Lloyd', age: 82, currently_working: true)
    @actor_4 = @movie_3.actors.create!(name: 'Lea Thompson', age: 60, currently_working: true)
    @actor_5 = @movie_3.actors.create!(name: 'Michael J. Fox', age: 59, currently_working: false)
    @actor_6 = @movie_3.actors.create!(name: 'Claudia Wells', age: 54, currently_working: true)

    @movie_2.actors << @actor_2
    @movie_1.actors << @actor_3
    @movie_2.actors << @actor_3
  end

  it 'displays the actor name and age' do
    visit "/actors/#{@actor_3.id}"

    expect(page).to have_content 'Christopher Lloyd'
    expect(page).to have_content 'Age: 82'
  end

  it 'has a list of all actors this actor has worked with' do
    visit "/actors/#{@actor_3.id}"
    
    expect(page).to have_content('Samuel L. Jackson', count: 1)
    expect(page).to have_content 'Harrison Ford'
    expect(page).to have_content 'Lea Thompson'
    expect(page).to have_content 'Michael J. Fox'
    expect(page).to have_content 'Claudia Wells'
  end
end 