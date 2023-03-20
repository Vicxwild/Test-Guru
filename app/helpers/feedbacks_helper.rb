module FeedbacksHelper
  def admin_email
    Admin.first.email
  end
end
