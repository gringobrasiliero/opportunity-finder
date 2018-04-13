class UsersController < ApplicationController

def show
end
def destroy
  reset_session
  redirect_to root_path
end
end
