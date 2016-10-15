class WelcomeController < ApplicationController
	def home
		if current_user
			@user = current_user 
		end
	end
end
