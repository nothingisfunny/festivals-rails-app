class CommentsController < ApplicationController
	before_action :set_festival

	def index 
		@comments = @festival.comments
		@comments_data = []
		@comments.each do |comment|
			username = {"username" => User.find(comment.user_id).name}
			comment = JSON::parse(comment.to_json).merge(username)
			@comments_data << comment
		end
		render :json => @comments_data
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
