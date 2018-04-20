class ApplicationsController < ApplicationController

  #begin new Application to Opportunity
    def new
       @opportunity = params{:opportunity_id}
       @user = current_user
      @application = Application.new
    end

    def create
      @user = current_user
      @application = @user.applications.build(application_params)
      @application.save

      redirect_to root_path
    end

    def show
      @application = Application.find(params[:id])

    end

#Show all current Applications applied for
  def index
    @user = current_user
    @applications = Application.all
  end





  private

  def application_params
     params.require(:application).permit( :qualified, :legal, :month_commitment, :reason_for_interest, :user_id, :opportunity_id, :id)
   end
end
