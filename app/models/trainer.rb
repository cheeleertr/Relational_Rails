class Trainer < ApplicationRecord
  has_many :pokemons, dependent: :destroy #destroy may not be the best way per khoa

  validates_presence_of :name

  def pokemons_count
    pokemons.count
  end

  def pokemons_by_name
    pokemons.order(:name)
  end

  def pokemons_over_level(number)
    pokemons.where("level > #{number}")
  end

  def self.by_created_at
    order(:created_at)
  end
end