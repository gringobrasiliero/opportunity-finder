class ProfilesController < ApplicationController

  def new
    @user = current_user
    @profile = Profile.new
  end

  def create
    @user = current_user
    @profile = @user.build_profile(profile_params)
    if @profile.valid?
      @profile.save
    redirect_to @profile
  else
    render "new"
end
end

  def index
    @user = current_user
    @profile = @user.profile
  end

  def show
    @user = current_user
    @profile = Profile.find(params[:id])
  end

  def edit
    @user = current_user
    @profile = @user.profile
  end

  def update
    @user = current_user
    @profile = @user.profile
    @profile.update(profile_params)
    redirect_to profile_path(@profile)

  end


  private

  def profile_params
     params.require(:profile).permit(:user_id, :first_name, :last_name, :location, :profession, :uid, :picture_url, :business_name, :id)
   end

end
