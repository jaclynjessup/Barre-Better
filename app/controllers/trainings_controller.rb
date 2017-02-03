class TrainingsController < ApplicationController
  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @trainings = Training.all
    end
  end

  def show
    @training = Training.find(params[:id])
    @users = @training.users
  end

  def new
    @training = Training.new
    @types = BarreType.all
    @time = []
    @timeslots = Timeslot.all
    @timeslots.each do |timeslot|
      @time << "#{timeslot.start_time} - #{timeslot.end_time}"
    end
    @instructors = Instructor.all
  end

  def create
    @training = Training.new(params_strong)
    if @training.save
      flash[:notice] = "Class has been added to the schedule."
      redirect_to trainings_path
    else
      flash[:notice] = @training.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @training = Training.find(params[:id])
    @types = BarreType.all
    @time = []
    @timeslots = Timeslot.all
    @timeslots.each do |timeslot|
      @time << "#{timeslot.start_time} - #{timeslot.end_time}"
    end
    @instructors = Instructor.all
  end

  def update
    @training = Training.find(params[:training_id])
    if @training.save
      flash[:notice] = "Class has been added to the schedule."
      redirect_to trainings_path
    else
      flash[:notice] = @training.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def params_strong
    params.require(:training).permit(
      :barre_type_id,
      :timeslot_id,
      :instructor_id,
      :date
    )
  end
end
