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
end