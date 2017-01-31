class TrainingsController < ApplicationController
  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @trainings = Training.all
    end
  end

  def new
    @training = Training.new
    @time = []
    @timeslots = Timeslot.all
    @timeslots.each do |timeslot|
      @time << "#{timeslot.start_time} - #{timeslot.end_time}"
    end
    @instructors = Instructor.all
  end

  def update
  end

  def destroy
  end
end
