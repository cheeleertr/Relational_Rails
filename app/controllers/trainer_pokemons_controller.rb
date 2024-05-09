class TrainerPokemonsController < ApplicationController
  def index
    @trainer = Trainer.find(params[:trainer_id])
    @pokemons = @trainer.pokemons
  end
end