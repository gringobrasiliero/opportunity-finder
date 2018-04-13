class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

def create
  @profile = Profile.create(profile_params)
  redirect_to @profile
end

private

def profile_params
   params.require(:profile).permit(:first_name, :last_name, :location, :profession)
 end
 




end
