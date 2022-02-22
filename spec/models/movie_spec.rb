require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :movie_actors }
    it { should have_many(:actors).through(:movie_actors) }
  end

  describe 'class methods' do
    xit 'can order the movies actor from youngest to oldest' do
      studio_1 = Studio.create!(name: "Hollywood Movies", location: "Los Angeles")
      movie_1 = studio_1.movies.create!(title: "V for Vendetta", creation_year: 2005, genre: "Action")
      actor_1 = Actor.create!(name: "Natalie Portman", age: 40)
      actor_2 = Actor.create!(name: "Stephen Fry", age: 64)
      actor_3 = Actor.create!(name: "Hugo Weaving", age: 59)

      MovieActor.create!(movie_id: movie_1.id, actor_id: actor_1.id)
      MovieActor.create!(movie_id: movie_1.id, actor_id: actor_2.id)
      MovieActor.create!(movie_id: movie_1.id, actor_id: actor_3.id)
# require "pry"; binding.pry
      expect(Movie.actors_age).to eq([actor_1, actor_3, actor_2])
    end

    xit 'can calculate average age' do
      studio_1 = Studio.create!(name: "Hollywood Movies", location: "Los Angeles")
      movie_1 = studio_1.movies.create!(title: "V for Vendetta", creation_year: 2005, genre: "Action")
      actor_1 = Actor.create!(name: "Natalie Portman", age: 40)
      actor_2 = Actor.create!(name: "Stephen Fry", age: 64)
      actor_3 = Actor.create!(name: "Hugo Weaving", age: 59)

      MovieActor.create!(movie_id: movie_1.id, actor_id: actor_1.id)
      MovieActor.create!(movie_id: movie_1.id, actor_id: actor_2.id)
      MovieActor.create!(movie_id: movie_1.id, actor_id: actor_3.id)
# require "pry"; binding.pry
      expect(Movie.average_age).to eq(54.3)
    end
  end
end
