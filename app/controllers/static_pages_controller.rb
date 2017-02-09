class StaticPagesController < ApplicationController
  def index
    @user = current_user
    @trainings = @user.trainings
    @goals = @trainings.where('date <= ?', Date.today)
  end

  def show
  end
end
