class ApplicationController < ActionController::Base
before_action :authenticate_user!
  def after_sign_in_path_for(resource)
  	user_path(resource)
  end
  def after_sign_out_path_for(resource)
  	root_path
  end
  before_action :configure_permitted_parameters, if: :devise_controller?
    protected
  def configure_permitted_parameters
    added_attrs = [ :name, :email, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
