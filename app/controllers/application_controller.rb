class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?



  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to main_app.root_url, :alert => exception.message }
      end
    end


  protected

# Requires a profile in order to view sections. Redirects to create profile if no profile.
  def require_profile
    @user = current_user
    if @user.profile == nil
      flash[:error] = "You must have a profile to view this section"
      redirect_to new_profile_path
    end
   end

  def configure_permitted_parameters #for devise
    update_attrs = [:id, :opportunity_provider, :provider, :first_name, :last_name, :location, :picture_url, :profession, :positions, :password ]
    devise_parameter_sanitizer.permit(:sign_up, keys: update_attrs )
    devise_parameter_sanitizer.permit(:account_update, keys: update_attrs)
  end

end
