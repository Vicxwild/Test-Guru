class FeedbacksMailer < ApplicationMailer
  def contact(feedback, user)
    @feedback = feedback
    @user = user
    mail to: admin_email, subject: t(".subject")
  end
end
