class TimeslotsController < ApplicationController
  def index
    @timeslots = Timeslot.all
  end

  def show
    @timeslot = Timeslot.find(params[:id])
  end

  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = Timeslot.new(params_strong)
    if @instructor.save
      flash[:notice] = "Timeslot has been created"
      redirect_to trainings_path
    else
      flash[:notice] = @timeslot.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @timeslot = Timeslot.find(params[:id])
  end

  def update
    @timeslot = Timeslot.find(params[:timeslot_id])
    if @timeslot.save
      flash[:notice] = "Timeslot has been created"
      redirect_to trainings_path
    else
      flash[:notice] = @timeslot.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def params_strong
    params.require(:timslot).permit(
      :start_time,
      :end_time
    )
  end
end
