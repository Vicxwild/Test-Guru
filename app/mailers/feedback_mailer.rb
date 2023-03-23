class FeedbackMailer < ApplicationMailer
  include FeedbacksHelper

  def contact(feedback, user)
    @feedback = feedback
    @user = user
    mail to: admin_email, subject: t(".subject")
  end
end
