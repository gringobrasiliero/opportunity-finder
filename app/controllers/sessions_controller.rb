class SessionsController < ApplicationController
  def new
  end

def create
  if auth = request.env["omniauth.auth"]
   @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.email = auth['info']['email']
      u.first_name = auth['info']['first_name']
      u.last_name = auth['info']['last_name']
      u.profession = auth['info']['profession']
      u.picture_url = auth['info']['image']
      u.location = auth ['info']['location']
      u.positions = auth['info']['positions']
    end

    end
  linkedin
  if auth = request.env["omniauth.auth"]

   current_user = @user.uid

   render 'welcome/home'
end


  def destroy
    reset_session
    redirect_to root_path
  end



private

def auth
  request.env['omniauth.auth']
end

end
