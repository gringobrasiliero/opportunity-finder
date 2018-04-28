class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?



  protected


  def configure_permitted_parameters
update_attrs = [:opportunity_provider, :provider, :first_name, :last_name, :location, :picture_url, :profession, :positions ]
    devise_parameter_sanitizer.permit(:sign_up, keys: update_attrs )
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs

  end

end
