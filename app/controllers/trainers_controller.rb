class TrainersController < ApplicationController
  def index
    # pry
    @trainers = Trainer.all.sort_by {|trainer| trainer.created_at}
  end

  def show
    @trainer = Trainer.find(params[:trainer_id])
    # binding.pry
    @count = @trainer.pokemons.count
  end
end