class OpportunitiesController < ApplicationController

def index
  @opportunities = Opportunity.all
end

def show
  @opportunity = Opportunity.find(params[:id])
end

def new
  @opportunity = Opportunity.new
end

def create
  @user = current_user
  @opportunity = @user.opportunities.build(opportunity_params)
  @opportunity.save
  redirect_to opportunity_path(@opportunity)
end

private

def opportunity_params
  params.require(:opportunity).permit(:title, :description, :user_id)
end

end
