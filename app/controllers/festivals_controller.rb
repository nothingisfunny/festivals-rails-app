class FestivalsController < ApplicationController
	def index
		@festivals = Festival.all
	end

	def new
		@festival = Festival.new
	end

	def create
		@festival = Festival.create(festival_params)
		if @festival.save
        	redirect_to festival_path(@festival)
      	else
        	render 'new'
     	end
	end

	def show
		@festival = Festival.find(params[:id])
	end

	def edit
		@festival = Festival.find(params[:id])
	end

	def update
		@festival = Festival.find(params[:id])
		@festival.update(festival_params)
		redirect_to festival_path(@festival)
	end

	def destroy
		@festival = Festival.find(params[:id])
		@festival.destroy
	end

	private

	def festival_params
		params.require(:festival).permit(:name, :category_id, :location, :venue, :line_up, :website, :start, :end, :world_part_id, :creator_id)
	end
end