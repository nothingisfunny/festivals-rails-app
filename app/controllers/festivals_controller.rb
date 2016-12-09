class FestivalsController < ApplicationController
	def index
		if request.get?
			@festivals = Festival.all
		else
			@world_part = params[:world_part]
			@category = params[:category]
			if !params[:world_part].empty?
				@festivals = Festival.all.where(world_part_id: params[:world_part])
			else
				@festivals = Festival.all
			end

			if !params[:category].empty?
				@festivals = @festivals.where(category_id: params[:category])
			end
		end
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