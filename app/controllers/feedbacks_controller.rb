class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    feedback = Feedback.new(feedback_params)

    if feedback.valid?
      FeedbackMailer.contact(feedback, current_user).deliver_now
      flash[:notice] = t(".notice")
      redirect_to root_path
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
