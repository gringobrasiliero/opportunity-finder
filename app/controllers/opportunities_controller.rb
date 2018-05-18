class OpportunitiesController < ApplicationController
before_action :authenticate_user!
before_action :require_profile


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
    if params[:user_id]
      @opportunities = User.find(params[:user_id]).opportunities

    else
      @opportunities = Opportunity.all
    end
  end

  def show
    @opportunity = Opportunity.find(params[:id])
    @user = current_user
    @opportunities = @user.opportunities.all

    if searcher?
      @application = Application.new
    else

    if !params[:filter].blank?
      if params[:filter] == "Best Qualified"
        @applications = @opportunity.applications.best_candidates
      elsif params[:filter] == "Most Recent"
        @applications = @opportunity.applications.sort_by_newest
      elsif params[:filter] == "Oldest"
        @applications = @opportunity.applications.sort_by_oldest
      end
    else
      @applications = @opportunity.applications
    end
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
