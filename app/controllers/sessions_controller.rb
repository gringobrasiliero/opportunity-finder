class SessionsController < ApplicationController
  def new
  end

def create

  linkedin


 end
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
