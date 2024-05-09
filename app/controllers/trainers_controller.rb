class TrainersController < ApplicationController
  def index
    @trainers = Trainer.all
  end

  def show
    # binding.pry
    @trainer = Trainer.find(params[:trainer_id])
  end
end