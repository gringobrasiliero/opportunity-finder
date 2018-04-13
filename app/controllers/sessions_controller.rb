class SessionsController < ApplicationController
  def new
  end

  def destroy
session.delete :email
redirect_to root_path
end


end
