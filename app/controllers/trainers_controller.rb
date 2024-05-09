class TrainersController < ApplicationController
  def index
    # pry
    @trainers = Trainer.all.sort_by {|trainer| trainer.created_at}
  end

  def show
    # binding.pry
    @trainer = Trainer.find(params[:trainer_id])
  end
end