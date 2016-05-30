class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :update, :edit, :destroy]

  def index
    #code
  end

  def new
    @workout = Workout.new
  end

  def show
  end

  def edit
    #code
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to @workout
    else
      redirect_to "new"
    end
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private
    def workout_params
      params.require(:workout).permit(:date, :workout, :mood, :length)
    end

    def find_workout
      @workout = Workout.find(params[:id])
    end
end
