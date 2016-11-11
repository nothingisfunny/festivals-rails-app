class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
  	request.env['omniauth.origin'] || root_path
  end
end
