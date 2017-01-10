class UsersController < ApplicationController
	def show 
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to user_path(user)
	end

	def festivals_index
		@user = current_user
    	@festivals = Festival.where(creator_id: current_user.id).to_a
    	render template: 'festivals/index'
	end

	def festival
	end

	private

	def user_params
		params.require(:user).permit(:name, :email)
	end
end
