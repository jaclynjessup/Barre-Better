class TimeslotsController < ApplicationController
  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = Timeslot.new(params_strong)
    if @instructor.save
      flash[:notice] = "Timeslot has been created"
      redirect_to instructors_path
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
      redirect_to instructors_path
    else
      flash[:notice] = @timeslot.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @timeslot = Timeslot.find(params[:id])
    @timeslot.destroy
    flash[:notice] = "Timeslot Deleted!"
    redirect_to instructors_path
  end

  private

  def params_strong
    params.require(:timeslot).permit(
      :start_time,
      :end_time
    )
  end
end
