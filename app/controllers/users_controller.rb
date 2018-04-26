class UsersController < ApplicationController

def show
@user = current_user
end

def destroy

  reset_session
  redirect_to root_path
end

def new
  @user = User.new
end


def create
  @user = user.new(params[:id])
    if user.save
      session[:user_id] = @user.id
      redirect to user_path(@user)
    end
end

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :opportunity_provider, :uid, :id, :provider, :first_name, :last_name)
end

end
