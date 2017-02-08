class BarreTypesController < ApplicationController
  def index
    @types = BarreType.all
  end

  def new
    @type = BarreType.new
  end

  def create
    @type = BarreType.new(params_strong)
    if @type.save
      flash[:notice] = "You've updated the Barre Types."
      redirect_to barre_types_path
    else
      flash[:notice] = @type.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @type = BarreType.find(params[:id])
    @types = BarreType.all
  end

  def update
    @type = BarreType.find(params[:barre_type_id])
    if @type.save
      flash[:notice] = "You've updated the Barre Types."
      redirect_to barre_types_path
    else
      flash[:notice] = @type.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def params_strong
    params.require(:barretype).permit(
      :start_time,
      :end_time
    )
  end
end
