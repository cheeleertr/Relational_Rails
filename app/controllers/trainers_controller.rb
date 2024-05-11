class TrainersController < ApplicationController
  def index
    # pry
    @trainers = Trainer.all.sort_by {|trainer| trainer.created_at}
  end

  def show
    # binding.pry
    @trainer = Trainer.find(params[:trainer_id])
  end

  def new
  end

  def create
    trainer = Trainer.new({
      name: params[:trainer][:name],
      badges: params[:trainer][:badges],
      full_team_of_six: params[:trainer][:full_team_of_six],
    })

    trainer.save

    redirect_to "/trainers"
  end

  def edit
    @trainer = Trainer.find(params[:trainer_id])
  end

  def update
    trainer = Trainer.find(params[:trainer_id])
    trainer.update({
      name: params[:trainer][:name],
      badges: params[:trainer][:badges],
      full_team_of_six: params[:trainer][:full_team_of_six],
    })

    trainer.save

    redirect_to "/trainers/#{trainer.id}"
  end

  def destroy
    destroy_trainers_pokemons
    trainer = Trainer.find(params[:trainer_id])
    trainer.destroy
    # pry
    redirect_to "/trainers"
  end

  def destroy_trainers_pokemons
    pokemons = Pokemon.where(trainer_id: params[:trainer_id])
    pokemons.each {|pokemon| pokemon.destroy}
  end
end