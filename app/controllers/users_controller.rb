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
		user.user_festival.create(festival_id: params[:festival_id], status:"going")
		festival_data = {username: user.name, userpath: user_path(user)}
		render json: festival_data
	end

	def unattend
		user = User.find(params[:user_id])
		festival = Festival.find(params[:festival_id])
		user.user_festival.find_by(festival_id: festival.id).delete
		festival_data = {username: user.name, userpath: user_path(user)}
		render json: festival_data
	end

	private

	def user_params
		params.require(:user).permit(:name, :email)
	end
end
