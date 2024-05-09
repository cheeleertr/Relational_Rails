class Trainer < ApplicationRecord
  has_many :pokemons

  validates_presence_of :name
end