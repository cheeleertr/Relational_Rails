class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.where(in_team: true)
    # @pokemons = Pokemon.all
    
  end

  def show
    @pokemon = Pokemon.find(params[:pokemon_id])
  end

  def edit
    @pokemon = Pokemon.find(params[:pokemon_id])
  end

  def update
    pokemon = Pokemon.find(params[:pokemon_id])
    pokemon.update({
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

    redirect_to "/pokemons/#{pokemon.id}"
  end

  def destroy
    pokemon = Pokemon.find(params[:pokemon_id])
    pokemon.destroy

    redirect_to "/pokemons"
  end
end