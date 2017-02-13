class TrainingsController < ApplicationController
  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @trainings = Training.where('date >= ?', Date.today).order(:date, :timeslot_id)
    end
  end

  def show
    @training = Training.find(params[:id])
    @users = @training.users
    @user_history = UserHistory.find_by(user: current_user, training: @training)
  end

  def new
    @training = Training.new
    @types = BarreType.all
    @timeslots = Timeslot.all
    @instructors = Instructor.all
  end

  def create
    @training = Training.new(params_strong)
    @types = BarreType.all
    @timeslots = Timeslot.all
    @instructors = Instructor.all
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
    @timeslots = Timeslot.all
    @instructors = Instructor.all
  end

  def update
    @training = Training.find(params[:id])
    if @training.save
      flash[:notice] = "Class has been added to the schedule."
      redirect_to trainings_path
    else
      flash[:notice] = @training.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    flash[:notice] = "Class Deleted!"
    redirect_to trainings_path
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
