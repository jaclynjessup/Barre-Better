class UserHistoriesController < ApplicationController
  def create
    @training = Training.find(params[:training_id])
    @user_history = UserHistory.new
    @user_history.user = current_user
    @user_history.training = @training
      if @user_history.save
        flash[:notice] = "You've successfully reserved your spot at the barre!"
        redirect_to training_path(@training)
      else
        flash[:notice] = "You've already reserved your spot at the barre!"
        redirect_to training_path(@training)
      end
  end

  def destroy
    @user_history = UserHistory.find(params[:id])
    if @user_history.destroy
      flash[:notice] = "We're sorry you can't join us at the barre."
      reredirect_to training_path(@training)
    else
      "You have not reserved your spot at the barre yet."
    end
  end
end
