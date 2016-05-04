class Admin::SessionsController < Admin::ApplicationController

  def new
  end

  def create
    admin = Admin.find_by(username: params[:session][:username])

    if admin && admin.authenticate(params[:session][:passsword])
      create_session(admin)
      flash[:notice] = "welcome #{admin.username}!"
      redirect_to admin_root_path
    else
      flash.now[:error] = "invalid email/password combination"
      render :new
    end
  end

  def destroy
    destroy_session(current_user)
    flash[:notice] = "Successfully signed out."
    redirect_to root_path
  end

  private

  def create_session(admin)
    session[:admin_id] = admin.id
  end

  def destroy_session(admin)
    session[:admin_id] = nil
  end

  def current_user
    Admin.find_by(id: session[:admin_id])
  end

end
