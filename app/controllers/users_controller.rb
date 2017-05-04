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
    	@festivals = Festival.where(creator_id: current_user.id)
    	render template: 'festivals/index'
	end

	def festival
	end

	def attend
		user = User.find(params[:user_id])
		festival = Festival.find(params[:festival_id])
		if params[:action] == "create"
			user.user_festival.create(festival_id: params[:festival_id], status:"going")
		elsif params[:action] == "delete"
			user.user_festival.find_by(festival_id).delete
		end
		redirect_to festival_path(festival)
	end
	private

	def user_params
		params.require(:user).permit(:name, :email)
	end
end
