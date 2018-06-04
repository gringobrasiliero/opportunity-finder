class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def index
    @user = current_user
    redirect_to root_path
  end

  def create
    @user = user.new(params[user_params])
    if user.save
      session[:user_id] = @user.id
      redirect to new_profile_path
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :opportunity_provider, :uid, :id, :provider, opportunity_ids:[], opportunities_attributes: [:title, :description, :user_id] )
  end

end
