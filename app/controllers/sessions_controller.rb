class SessionsController < ApplicationController
  def new
  end

  def destroy
    reset_session
    redirect_to root_path
  end


end
