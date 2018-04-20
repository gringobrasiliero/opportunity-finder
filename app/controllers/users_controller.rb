class UsersController < ApplicationController

def show
@user = current_user
end

def destroy
  reset_session
  redirect_to root_path
end
def create

end

end
