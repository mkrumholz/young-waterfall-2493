require 'rails_helper'

RSpec.describe 'The studio show page' do
  before :each do
    @studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @movie_1 = @studio.movies.create!(title:'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure') 
    @movie_1 = @studio.movies.create!(title:'Jurassic Park', creation_year: 1993, genre: 'Action/Adventure') 
    @movie_1 = @studio.movies.create!(title:'Minions', creation_year: 2015, genre: 'Family Comedy') 
    @movie_1 = @studio.movies.create!(title:'Shrek', creation_year: 2001, genre: 'Family Comedy') 
    @movie_1 = @studio.movies.create!(title:'Back to the Future', creation_year: 1985, genre: 'Sci-Fi') 
  
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

  it 'should have a list of unique actors from the studio movies'

  it 'should display actors in order by age descending'

  it 'should only display currently working actors'
end