class ProfilesController < ApplicationController
    #validates_confirmation_of :password
    #attr_accessible :password, :password_confirmation
    
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    
    if @profile.save
      flash[:success] = "Your account has been created successfully."
      session[:profile_id] = @profile.id
      redirect_to profile_path(session[:profile_id])
    else
      flash[:error] = "There were errors with your account setup. Try again."
      redirect_to register_path
    end
  end
  

  def show
    @profile = Profile.find(params[:id])
  end

  def index
    @profiles = Profile.all
  end


  def edit
    @profile = Profile.find(params[:id])
  end
  
  def update
    @profile = Profile.find(params[:id])
    
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render 'edit'
    end
  end
  
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    
    redirect_to profiles_path
  end

  private
    def profile_params
      params.require(:profile).permit(:firstname, :lastname, :password, :password_confirmation, :dob, :hired,  :workphone, :jobtitle, :terminated,:homephone, :email, :comments)
    end
  
end
