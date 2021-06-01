require 'rails_helper'

RSpec.describe 'The studio show page' do
  before :each do
    @studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
  end
  
  it 'should display the studio name and location' do
    visit "/studios/#{@studio.id}"

    expect(page).to have_content 'Universal Studios'
    expect(page).to have_content 'Hollywood'
  end

  it 'should display all movie titles'

  it 'should have a list of unique actors from the studio movies'

  it 'should display actors in order by age descending'

  it 'should only display currently working actors'
end