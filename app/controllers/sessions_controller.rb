class SessionsController < ApplicationController
  def new

    if auth = request.env["omniauth.auth"]
     @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
       u.email = auth['info']['email-address']
       u.first_name = auth['info']['first-name']
       u.last_name = auth['info']['last-name']
       u.image = auth['info']['picture-url']
     end

     session[:user_id] = @user.id

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
