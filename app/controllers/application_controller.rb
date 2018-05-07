class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def require_profile
    @user = current_user
    if @user.profile == nil
      flash[:error] = "You must have a profile to view this section"
       redirect_to new_profile_path
     end
   end
   
  def configure_permitted_parameters
update_attrs = [:id, :opportunity_provider, :provider, :first_name, :last_name, :location, :picture_url, :profession, :positions ]
    devise_parameter_sanitizer.permit(:sign_up, keys: update_attrs )
    devise_parameter_sanitizer.permit(:account_update, keys: update_attrs)

  end

end
