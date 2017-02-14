class BarreTypesController < ApplicationController

  def new
    @type = BarreType.new
  end

  def create
    @type = BarreType.new(params_strong)
    if @type.save
      flash[:notice] = "You've updated the Barre Types."
      redirect_to instructors_path
    else
      flash[:notice] = @type.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @type = BarreType.find(params[:id])
  end

  def update
    @type = BarreType.find(params[:id])
    if @type.save
      flash[:notice] = "You've updated the Barre Types."
      redirect_to instructors_path
    else
      flash[:notice] = @type.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @type = BarreType.find(params[:id])
    @type.destroy
    flash[:notice] = "Barre Type Deleted!"
    redirect_to instructors_path
  end

  private

  def params_strong
    params.require(:barre_type).permit(
      :name,
      :description
    )
  end
end
