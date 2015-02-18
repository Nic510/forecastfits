class CommentsController < ApplicationController

	def create
		# generates comment based on specific location
		@location = Location.find(params[:id])
		@comment = @location.comments.create(comment_params)
		# response rendered html partial with local variables passed in
		respond_to do |format|
			format.html { render :partial => "comments/comment",  locals: {comment: @comment} }
		end
	
	end

	private 
	# allowed comment attributes
		def comment_params
			params.require(:comment).permit(:commenter, :jacket, :top, :pants, :shoes, :body)
		end
end
