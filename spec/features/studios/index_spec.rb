require 'rails_helper'

RSpec.describe 'studio index page' do
  it 'displays a studios name and location' do
    studio_1 = Studio.create!(name: "Hollywood Movies", location: "Los Angeles")
    studio_2 = Studio.create!(name: "We Love Movies", location: "Orange County")
    studio_3 = Studio.create!(name: "Pixar", location: "SoCal")

    visit "/studios"

    expect(page).to have_content("All Studios")
    expect(page).to have_content(studio_1.name)
    expect(page).to have_content(studio_1.location)
    expect(page).to have_content(studio_2.name)
    expect(page).to have_content(studio_2.location)
    expect(page).to have_content(studio_3.name)
    expect(page).to have_content(studio_3.location)
  end

  it 'shows the titles of all its movies' do

  end
end
