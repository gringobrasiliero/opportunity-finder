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

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :opportunity_provider)
end

end
