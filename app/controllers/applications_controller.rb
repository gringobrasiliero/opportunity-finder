class ApplicationsController < ApplicationController
before_action :authenticate_user!
before_action :require_profile

def new
    @opportunity = Opportunity.find_by(id: params[:opportunity_id])
    @application = Application.new(opportunity_id: params[:opportunity_id])
    authorize! :new, @application, :message => "Access Denied."

  end

  def create
    # binding.pry
    @application = current_user.applications.new(application_params)
    @opportunity = Opportunity.find_by(id: params[:opportunity_id])
    @user = current_user
    if @application.valid?
      @application.save
      respond_to do |format|
            format.html { render :show }
            format.json {render json: @application, status: 200}

      end

    else
      # If Application is not valid, redirects to application/new
      render "new"
    end
  end

  def edit
    @user = current_user

    if params[:opportunity_id]
      opportunity = Opportunity.find_by(id: params[:opportunity_id])
      if opportunity.nil?
        redirect_to opportunities_path, alert: "Opportunity not found."
      else
        @application = opportunity.applications.find_by(id: params[:id])
        redirect_to applications_path(@application), alert: "Application not found." if @application.nil?
      end
    else
      @application = Application.find(params[:id])
      authorize! :edit, @application, :message => "Access Denied."
    end
  end

  def update
    @user = current_user
    @application = Application.find(params[:id])
    @application.update(application_params)
      flash[:notice] = "Application Updated"
    redirect_to applications_path
  end

  def show
    @user = current_user
    @application =  Application.find(params[:id])
    respond_to do |format|
          format.html { }
          format.json {render json: @application, status: 200}

    end
    end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    redirect_to applications_path
  end

  def index
    @user = current_user
    @applications = @user.applications.all
    respond_to do |format|
          format.html { render :index }
          format.json {render json: @applications, status: 200}

    end
  end

  def submitted
    @user = current_user
    @application = Application.find(params[:id])
  end


  private

  def application_params
     params.require(:application).permit( :qualified, :legal, :criminal_record, :description_of_criminal_record, :transportation, :month_commitment, :reason_for_interest, :user_id, :opportunity_id, user_attributes:[:id])
   end
end
