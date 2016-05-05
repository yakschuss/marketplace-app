class Admin::ApplicationController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  protect_from_forgery with: :exception

  def current_user
    Admin.find_by(id: session[:admin_id])
  end

  def require_sign_in
    unless current_user
      flash[:error] = "You must be logged in to do that"
      redirect_to new_admin_session_path
    end
  end

end
