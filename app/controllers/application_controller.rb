class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from PG::UniqueViolation, with: :email_already_registered
  include Pundit
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
  	request.env['omniauth.origin'] || root_path
  end

  def email_already_registered
  	flash[:error] = "Sorry. This email was already registered. Try the sign in button."
  	redirect_to '/'
  end

   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
