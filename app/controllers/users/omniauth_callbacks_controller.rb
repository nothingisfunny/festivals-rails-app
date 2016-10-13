class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
 	sign_in_and_redirect @user    
  end

  def google_oauth2
  	@user = User.from_omniauth(request.env["omniauth.auth"])
  	if @user.persisted?
  		sign_in_and_redirect root_path, event: :authentication
  	else
  		redirect_to root_path, flash: {error: 'Authentication failed!'}
  	end
  end
end