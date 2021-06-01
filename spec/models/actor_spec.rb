require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many :cast_members }   
    it { should have_many(:movies).through(:cast_members) }   
  end

  describe 'class methods' do
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

    describe '.studio_list' do
      it 'returns a list of unique, currently working actors for given studio id listed by age desc' do
        expect(Actor.studio_list(@studio.id)).to eq [@actor_4, @actor_3, @actor_5, @actor_2]
      end
    end
  end
end