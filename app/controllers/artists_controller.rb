class ArtistsController < ApplicationController
	def index
		if params[:festival_id]
			@festival = Festival.find(params[:festival_id])
			@artists = @festival.artists
		end
	end

	def new
		@festival = Festival.find(params[:festival_id])
		@artist = Artist.new()
	end

	def create
		@festival = Festival.find(params["artist"]["festival_id"])
		@artist = Artist.find_or_create_by(name: params["artist"]["name"])
		ArtistFestival.create(artist_id: @artist.id, festival_id: @festival.id, description: params["artist"]["description"])
		redirect_to festival_artists_path(@festival)
	end

	def artist_params
		params.require(:artist).permit(:name, :description)
	end
end
