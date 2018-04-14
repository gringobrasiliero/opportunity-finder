class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

def create
  @profile = Profile.create(profile_params)
  redirect_to @profile
end

def index
  @user = current_user
  @profile = @user.profile
end

def show
  @user = current_user
  @profile = @user.profile
end

private

def profile_params
   params.require(:profile).permit(:user_id, :first_name, :last_name, :location, :profession)
 end





end
