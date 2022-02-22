class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  # def self.actors_age
  #   actors.order(age: :desc)
  # end

  # def self.average_age
  #   actors.average(:age).round(1)
  # end
end
