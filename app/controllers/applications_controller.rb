class ApplicationsController < ApplicationController

#Show all current Applications applied for
  def index
    @user = current_user
    @applications = Application.all
  end

#begin new Application to Opportunity
  def new
    @application = Application.new
  end

  def create
    @user = current_user
    @application = @user.applications.build(application_params)
    @application.save
    # binding.pry
    redirect_to applications_path(@application)
  end

  private

  def application_params
     params.require(:application).permit(:qualified, :legal, :month_commitment, :reason_for_interest, :user_id, :opportunity_id)
   end
end
