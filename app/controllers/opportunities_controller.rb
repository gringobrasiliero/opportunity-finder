class OpportunitiesController < ApplicationController
before_action :authenticate_user!
include ApplicationHelper

  def new
@user = current_user
    @opportunity = Opportunity.new
  end

  def create
    @user = current_user
      @opportunity = @user.opportunities.new(opportunity_params)
if @opportunity.valid?
  @opportunity.save
  redirect_to opportunities_path(@opportunity)
else
  render 'new'
    end
end

def index
  @user = current_user
  @opportunities = Opportunity.all

end

def show
  @opportunity = Opportunity.find(params[:id])
  @user = current_user
  @opportunities = @user.opportunities.all
if searcher?
@application = Application.new
else



end
end



def update
  @user = current_user
  @opportunity = Opportunity.find(params[:id])

  @opportunity.update(opportunity_params)

redirect_to opportunity_path(@opportunity)
end

private

def opportunity_params
  params.require(:opportunity).permit(:title, :description, :user_id, application_ids:[], applications_attributes: [ :qualified, :legal, :month_commitment, :reason_for_interest, :user_id, :opportunity_id, :id])
end

end
