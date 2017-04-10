class CommentsController < ApplicationController
	before_action :set_festival

	def index 
	end
	def new 
	end
	def create
		@comment = @festival.comments.create(comments_params)
		if @comment.save
			render 'comments/show', :layout => false
		end
	end

	def show
	end

	private

	def comments_params
		params.require(:comment).permit(:content, :user_id, :festival_id)
	end
	def set_festival
		@festival = Festival.find(params[:festival_id])
	end
end
