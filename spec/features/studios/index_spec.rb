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
    studio_1 = Studio.create!(name: "Hollywood Movies", location: "Los Angeles")
    studio_2 = Studio.create!(name: "We Love Movies", location: "Orange County")
    studio_3 = Studio.create!(name: "Pixar", location: "SoCal")

    movie_1 = studio_1.movies.create!(title: "V for Vendetta", creation_year: 2005, genre: "Action")
    movie_2 = studio_1.movies.create!(title: "Hercules", creation_year: 1997, genre: "Action")
    movie_3 = studio_1.movies.create!(title: "Perfect Storm", creation_year: 2000, genre: "Drama")

    movie_4 = studio_2.movies.create!(title: "Saving Private Ryan", creation_year: 1998, genre: "Action")
    movie_5 = studio_2.movies.create!(title: "Shutter Island", creation_year: 2010, genre: "Thriller")

    movie_6 = studio_3.movies.create!(title: "Inception", creation_year: 2010, genre: "Suspense")

    visit "/studios"

    expect(page).to have_content(movie_1.title)
  end
end
