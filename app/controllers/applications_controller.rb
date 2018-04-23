class ApplicationsController < ApplicationController
before_action :authenticate_user!
  #begin new Application to Opportunity
    def new
      # @opportunity = params{:opportunity_id}
      @application = Application.new
    end

    def create
      # @opportunity = Opportunity.find(params[:id])
      @application = current_user.applications.create(application_params)
       @application.save
 # binding.pry
      redirect_to applications_path(@application)
    end

    def show
      @application = Application.find(params[:id])
      @opportunity = Opportunity.find(params[:id])

    end



#Show all current Applications applied for
  def index
    @user = current_user
    @applications = Application.all
  end





  private

  def application_params
     params.require(:application).permit( :qualified, :legal, :month_commitment, :reason_for_interest, :user_id, :opportunity_id, user_attributes:[:id])
   end
end
