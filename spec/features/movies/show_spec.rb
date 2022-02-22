require 'rails_helper'

RSpec.describe 'movie show page' do
  it 'shows the movies title, creation year, and genre' do
    studio_1 = Studio.create!(name: "Hollywood Movies", location: "Los Angeles")
    movie_1 = studio_1.movies.create!(title: "V for Vendetta", creation_year: 2005, genre: "Action")
    actor_1 = Actor.create!(name: "Natalie Portman", age: 40)
    actor_2 = Actor.create!(name: "Stephen Fry", age: 64)
    actor_3 = Actor.create!(name: "Hugo Weaving", age: 59)

    MovieActor.create!(movie_id: movie_1.id, actor_id: actor_1.id)
    MovieActor.create!(movie_id: movie_1.id, actor_id: actor_2.id)
    MovieActor.create!(movie_id: movie_1.id, actor_id: actor_3.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_1.creation_year)
    expect(page).to have_content(movie_1.genre)
  end

  it 'shows a list of its actors from youngest to oldest and their average age' do
    studio_1 = Studio.create!(name: "Hollywood Movies", location: "Los Angeles")
    movie_1 = studio_1.movies.create!(title: "V for Vendetta", creation_year: 2005, genre: "Action")
    actor_1 = Actor.create!(name: "Natalie Portman", age: 40)
    actor_2 = Actor.create!(name: "Stephen Fry", age: 64)
    actor_3 = Actor.create!(name: "Hugo Weaving", age: 59)

    MovieActor.create!(movie_id: movie_1.id, actor_id: actor_1.id)
    MovieActor.create!(movie_id: movie_1.id, actor_id: actor_2.id)
    MovieActor.create!(movie_id: movie_1.id, actor_id: actor_3.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to have_content("Actors")
    expect(actor_1.name).to appear_before(actor_3.name)
    expect(actor_3.name).to appear_before(actor_2.name)
    expect(page).to have_content("Average Age")
  end

  it 'can add actors actors to the movie' do
    studio_1 = Studio.create!(name: "Hollywood Movies", location: "Los Angeles")
    movie_1 = studio_1.movies.create!(title: "V for Vendetta", creation_year: 2005, genre: "Action")
    actor_1 = Actor.create!(name: "Natalie Portman", age: 40)
    actor_2 = Actor.create!(name: "Stephen Fry", age: 64)
    actor_3 = Actor.create!(name: "Hugo Weaving", age: 59)
    actor_4 = Actor.create!(name: "Sinead Cusack", age:74)

    MovieActor.create!(movie_id: movie_1.id, actor_id: actor_1.id)
    MovieActor.create!(movie_id: movie_1.id, actor_id: actor_2.id)
    MovieActor.create!(movie_id: movie_1.id, actor_id: actor_3.id)

    visit "/movies/#{movie_1.id}"

    expect(page).to_not have_content(actor_4.name)

    fill_in 'actor', with: 'Sinead Cusack'
    click_on "Add actor"

    expect(current_path).to eq("/movies/#{movie_1.id}")

    expect(page).to have_content(actor_4.name)
  end
end
