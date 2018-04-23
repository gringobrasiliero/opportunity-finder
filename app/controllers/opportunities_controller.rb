class OpportunitiesController < ApplicationController

  def new
    @opportunity = Opportunity.new
  end

  def create
    @user = current_user
      @opportunity = @user.opportunities.build(opportunity_params)
      @opportunity.save
      redirect_to opportunity_path(@opportunity)
    end


def index
  @opportunities = Opportunity.all
end

def show
@user = current_user
  @opportunity = Opportunity.find(params[:id])


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
