class FestivalsController < ApplicationController
	def index
		@festivals = Festival.all
		if params[:user_id]
			@user_festival_path = true
			@festivals = Festival.where(creator_id: params[:user_id])
		elsif params[:world_part] && !params[:world_part].empty?
			@festivals = Festival.all.where(world_part_id: WorldPart.find_by(name: params[:world_part]))
		else
			@festivals = Festival.all
		end

		if params[:category] && !params[:world_part].empty?
			@festivals = @festivals.where(category_id: Category.find_by(name: params[:category]))
		end
	end

	def new
		@festival = Festival.new
		@festival.artists.build
		@festival.artists.build
		@festival.artists.build
	end

	def create
		@festival = Festival.create(festival_params)
		if @festival.save
			params[:festival][:artists_attributes].each do |id, artist|
				if !artist[:name].empty? && !artist[:description].empty?
					ArtistFestival.create(festival_id: @festival.id, artist_id: Artist.find_by(name: artist[:name]).id, description: artist[:description])
				end
			end
        	redirect_to festival_path(@festival)
      	else
        	render 'new'
     	end
	end

	def show
		@festival = Festival.find(params[:id])
		@comments = @festival.comments
		@comment = Comment.new
	end

	def edit
		@festival = Festival.find(params[:id])
		if @festival.artists.empty?
			@festival.artists.build
			@festival.artists.build
			@festival.artists.build
		end
	end

	def update
		@festival = Festival.find(params[:id])
		@festival.update(festival_params)
		redirect_to festival_path(@festival)
		params[:festival][:artists_attributes].each do |id, artist|
				if !artist[:name].empty? && !artist[:description].empty?
					ArtistFestival.create(festival_id: @festival.id, artist_id: Artist.find_by(name: artist[:name]).id, description: artist[:description])
				end
		end
	end

	def destroy
		@festival = Festival.find(params[:id])
		@festival.destroy
		redirect_to festivals_path
	end

	def going
		@festival = Festival.find(params[:id])
		userfestival = UserFestival.find_or_create_by(user_id: current_user.id, festival_id: @festival.id) 
		userfestival.status = "going"
		userfestival.save
		flash[:notice] = "You are now attending #{@festival.name}!"
		redirect_to festival_path(@festival)
	end

	def interested
		@festival = Festival.find(params[:id])
		userfestival = UserFestival.find_or_create_by(user_id: current_user.id, festival_id: @festival.id)
		userfestival.status = "interested"
		userfestival.save
		flash[:notice] = "You have successfully saved #{@festival.name}!"
		redirect_to festival_path(@festival)
	end

	def approve	
		@festival = Festival.find(params[:id])
		@festival.approved = true
		@festival.save
		flash[:notice] = "#{@festival.name} approved!"
		redirect_to index_path
	end

	private

	def festival_params
		params.require(:festival).permit(:name, :category_id, :location, :venue, :line_up, :website, :start, :end, :world_part_id, :creator_id, artists_attributes: [:name, :description])
	end
end