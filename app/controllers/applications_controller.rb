class ApplicationsController < ApplicationController
before_action :authenticate_user!



  #begin new Application to Opportunity
    def new
      @opportunity = Opportunity.find(params[:id])
      @application = Application.new
    end

    def create
      @application = current_user.applications.new(application_params)
      @user = current_user
      if @application.valid?
        @application.save
        redirect_to applications_path(@application)
      else
        render "new"
end
    end

def edit
    @user = current_user
      @application = Application.find(params[:id])

  end

  def update
    @user = current_user
      @application = Application.find(params[:id])

    @application.update(application_params)

  redirect_to application_path(@application)
end



    def show
    

      @user = current_user
      @application =  Application.find(params[:id])
       @opportunity = Opportunity.find(params[:id])

    end

def destroy
@application = Application.find(params[:id])
@application.destroy
redirect_to applications_path
end


#Show all current Applications applied for
  def index
    @user = current_user
    @applications = Application.all
  end





  private

  def application_params
     params.require(:application).permit( :qualified, :legal, :criminal_record, :description_of_criminal_record, :transportation, :month_commitment, :reason_for_interest, :user_id, :opportunity_id, user_attributes:[:id])
   end
end
