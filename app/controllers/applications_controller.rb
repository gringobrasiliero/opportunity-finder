class ApplicationsController < ApplicationController

  #begin new Application to Opportunity
    def new
      # @opportunity = params{:opportunity_id}
      @application = Application.new
    end

    def create
      @user = current_user
      @application = Application.create(application_params)
      # @application.save
 # binding.pry
      redirect_to opportunities_path(@opportunity)
    end

    def show
      @application = Application.find(params[:id])

    end

    def show
      @opportunity = Opportunity.find(params[:id])
      @opportunity.applications.build()
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
