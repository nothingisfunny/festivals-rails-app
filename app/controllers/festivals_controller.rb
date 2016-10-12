class FestivalsController < ApplicationController
	def index
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
	end

	def update
	end

	def destroy
	end

	private

	def festival_params
		params.require(:festival).permit(:name, :category_id, :location, :venue, :line_up, :website)
	end
end