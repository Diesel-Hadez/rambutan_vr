class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.suspended?
        flash.now[:danger] = "This user has been suspended! Please call/email support to unsuspend your account."
        render 'new'
      else
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to user
      end
    else
      flash.now[:danger] = "Invalid combination!"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path 
  end

end
