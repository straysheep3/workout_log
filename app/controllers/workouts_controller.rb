class WorkoutsController < ApplicationController
  before_action :find_workout, only: [:show, :update, :edit, :destroy]

  def index
    @workouts = Workout.all.order("created_at DESC")
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
    if @workout.update(workout_params)
      redirect_to @workout
    else
      render "edit"
    end
  end

  def destroy
    @workout.destroy
    redirect_to root_path
  end

  private
    def workout_params
      params.require(:workout).permit(:date, :workout, :mood, :length)
    end

    def find_workout
      @workout = Workout.find(params[:id])
    end
end
