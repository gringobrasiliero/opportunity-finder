class UsersController < ApplicationController


def create
  # @user = User.new(user_params)
  # @user.save
  # redirect to user_path(current_user)
end


def show
  # @user= @user.find(params[:id])
end


def destroy
  reset_session
  redirect_to root_path
end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :location, :profession)
end

end
