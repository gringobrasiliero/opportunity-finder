class UsersController < ApplicationController


def create

  @user = User.new
  @user.first_name = params[:first_name]
  @user.last_name = params[:last_name]
  @user.location = params[:location]
  @user.profession = params[:profession]
  
  if @user.save
    session[:user_id] = @user.id
    redirect to user_path(@user)
  end
end


def show
  @user= User.find(params[:id])
end


def destroy
  reset_session
  redirect_to root_path
end
end
