class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @user = current_user

    if @feedback.valid?
      FeedbackMailer.contact(@feedback, @user).deliver_now
      redirect_to root_path
      flash[:notice] = t(".notice")
    else
      flash[:alert] = t(".alert")
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:subject, :body)
  end
end
