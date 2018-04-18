class ApplicationsController < ApplicationController

#Show all current Applications applied for
  def index
    @Applications = Application.all
  end

#begin new Application to Opportunity
  def new
    @application = Application.new
  end

  def create
    @user = current_user
    @application = @user.application.build(application_params)
    @opportunity.save
    redirect_to opportunity_path(@opportunity)
  end


  private

  def application_params
     params.require(:application).permit(:qualified, :legal, :month_commitment, :reason_for_interest, :user_id, :opportunity_id)
   end
end
