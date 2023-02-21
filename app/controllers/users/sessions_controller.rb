class Users::SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('.notice', user: current_user.first_name)
  end
end
