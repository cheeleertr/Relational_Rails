class TrainerPokemonsController < ApplicationController
  def index
    @trainer = Trainer.find(params[:trainer_id])
    @pokemons = @trainer.pokemons
  end

  def new
    # pry
    @trainer = Trainer.find(params[:trainer_id])
  end

  def create
    #need to create a trainer to create pokemon
    # pry
    trainer = Trainer.find(params[:trainer_id])
    pokemon = trainer.pokemons.new({
      name: params[:pokemon][:name],
      pokemon_type: params[:pokemon][:pokemon_type],
      level: params[:pokemon][:level],
      hit_points: params[:pokemon][:hit_points],
      attack: params[:pokemon][:attack],
      defense: params[:pokemon][:defense],
      speed: params[:pokemon][:speed],
      special: params[:pokemon][:special],
      in_team: params[:pokemon][:in_team],
    })

    pokemon.save

    redirect_to "/trainers/#{trainer.id}/pokemons"
  end
end