require 'rails_helper'

RSpec.describe 'The movie show page' do
  before :each do
    @studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

    # @movie_1 = @studio.movies.create!(title:'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure') 
    @movie_2 = @studio.movies.create!(title:'Jurassic Park', creation_year: 1993, genre: 'Action/Adventure') 
    # @movie_3 = @studio.movies.create!(title:'Minions', creation_year: 2015, genre: 'Family Comedy') 
    # @movie_4 = @studio.movies.create!(title:'Shrek', creation_year: 2001, genre: 'Family Comedy') 
    @movie_5 = @studio.movies.create!(title:'Back to the Future', creation_year: 1985, genre: 'Sci-Fi') 

    # @actor_1 = @movie_1.actors.create!(name: 'Harrison Ford', age: 78, currently_working: false)
    # @actor_2 = @movie_2.actors.create!(name: 'Laura Dern', age: 54, currently_working: true)
    @actor_3 = @movie_2.actors.create!(name: 'Samuel L. Jackson', age: 72, currently_working: true)
    @actor_1 = @movie_5.actors.create!(name: 'Christopher Lloyd', age: 82, currently_working: true)
    @actor_2 = @movie_5.actors.create!(name: 'Lea Thompson', age: 60, currently_working: true)
    @actor_3 = @movie_5.actors.create!(name: 'Michael J. Fox', age: 59, currently_working: false)
    @actor_4 = @movie_5.actors.create!(name: 'Claudia Wells', age: 54, currently_working: true)

    # @movie_2.actors << @actor_4
  end

  it 'displays the title, creation year, and genre of the movie' do
    visit "/movies/#{@movie_5.id}"

    expect(page).to have_content 'Back to the Future'
    expect(page).to have_content 'Year created: 1985'
    expect(page).to have_content 'Genre: Sci-Fi'
  end

  it 'displays a list of the cast members' do
    visit "/movies/#{@movie_5.id}"
    
    expect(page).to have_content 'Christopher Lloyd'
    expect(page).to have_content 'Lea Thompson'
    expect(page).to have_content 'Michael J. Fox'
    expect(page).to have_content 'Claudia Wells'
  end

  it 'can add an actor to the movie' do
    visit "/movies/#{@movie_5.id}"
    
    fill_in :name, with: 'Samuel L. Jackson'
    click_on 'Submit'

    expect(page).to have_content 'Samuel L. Jackson'
  end
end