require 'rails_helper'

RSpec.describe 'The studio show page' do
  before :each do
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

    @movie_2.actors << @actor_4
  end
  
  it 'should display the studio name and location' do
    visit "/studios/#{@studio.id}"

    expect(page).to have_content 'Universal Studios'
    expect(page).to have_content 'Hollywood'
  end

  it 'should display all movie titles' do
    visit "/studios/#{@studio.id}"
    
    expect(page).to have_content 'Raiders of the Lost Ark'
    expect(page).to have_content 'Jurassic Park'
    expect(page).to have_content 'Minions'
    expect(page).to have_content 'Shrek'
    expect(page).to have_content 'Back to the Future'
  end

  it 'should have a list of unique, currently working actors from the studio movies in order by age descending' do
    visit "/studios/#{@studio.id}"
    
    expect(page).to_not have_content 'Harrison Ford'
    # expect(page).to have_content 'Laura Dern'
    # expect(page).to have_content 'Samuel L. Jackson'
    # expect(page).to have_content 'Christopher Lloyd'
    # expect(page).to have_content 'Lea Thompson'

    expect(@actor_4.name).to appear_before(@actor_3.name)
    expect(@actor_3.name).to appear_before(@actor_5.name)
    expect(@actor_5.name).to appear_before(@actor_2.name)
  end
end