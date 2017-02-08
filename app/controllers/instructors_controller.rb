class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(params_strong)
    if @instructor.save
      flash[:notice] = "Instructor has been created"
      redirect_to trainings_path
    else
      flash[:notice] = @instructor.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    @instructor = Instructor.find(params[:instrutor_id])
    if @instructor.save
      flash[:notice] = "Instructor has been created"
      redirect_to trainings_path
    else
      flash[:notice] = @instructor.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def params_strong
    params.require(:instructor).permit(
      :full_name,
      :bio
    )
  end
end
