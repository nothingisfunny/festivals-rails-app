class ArtistsController < ApplicationController
	def index
		if params[:festival_id]
			@festival = Festival.find(params[:festival_id])
			@artists = @festival.artists
		end
	end
end
