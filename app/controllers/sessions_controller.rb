class SessionsController < ApplicationController
  def new
  end

def create
  # if auth = request.env["omniauth.auth"]
  #  @user = User.find_or_create_by(uid: auth['uid']) do |u|
  #     u.email = auth['info']['email']
  #
  #  end
linkedin
  @profile = Profile.find_or_create_by(uid: auth['uid']) do |u|
    u.first_name = auth['info']['first_name']
    u.last_name = auth['info']['last_name']
     u.picture_url = auth['info']['image']

   end


   current_user = @user.uid
# binding.pry
   render 'welcome/home'
 end


  def destroy
    reset_session
    redirect_to root_path
  end


end
private

def auth
  request.env['omniauth.auth']
end

end
