class OpportunitiesController < ApplicationController
before_action :authenticate_user!
  def new
@user = current_user
    @opportunity = Opportunity.new
  end

  def create
    @user = current_user
      @opportunity = @user.opportunities.create(opportunity_params)

      redirect_to opportunities_path(@opportunity)
    end


def index
  @user = current_user
  @opportunities = Opportunity.all
end

def show
@user = current_user
  @opportunity = Opportunity.find(params[:id])
@application = Application.new
# binding.pry
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
