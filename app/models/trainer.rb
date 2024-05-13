class Trainer < ApplicationRecord
  has_many :pokemons, dependent: :destroy

  validates_presence_of :name

  def pokemons_count
    # @trainer = Trainer(params[:trainer_id])
    self.pokemons.count
  end


end