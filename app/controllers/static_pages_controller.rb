class StaticPagesController < ApplicationController
  def index
    @user = current_user
    @trainings = @user.trainings
  end

  def show
  end
end
