class LoginsController < ApplicationController
  def new
    if logged_in?
      redirect_to profile_path(session[:profile_id])
    else
      render 'pages/register'
    end
  end
  
  def create
    profile = Profile.find_by(email: params[:email])
    
    if profile && profile.authenticate(params[:password])
      session[:profile_id] = profile.id
      flash[:success] = "Great, you are now logged in."
      redirect_to profile_path(session[:profile_id])
    else
      flash.now[:danger] = "Your login credentials are not correct."
      render 'pages/login'
    end
  end

  def show
  end
  
  def destroy
    session[:profile_id] = nil
    flash[:success] = "You are now logged out."
    redirect_to root_path
  end
end
