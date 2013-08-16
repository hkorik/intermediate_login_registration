class CommentsController < ApplicationController

	def create
		# render text: params
		user = User.find(current_user)
		comment = user.comments.new(params[:comment])
		if comment.save
			flash[:success_message] = "Comment Successfuly Created!"
			redirect_to user_path(params[:comment][:receiver_id])
		else
			flash[:error_message] = "There was an error in creating your comment."
			redirect_to user_path(params[:comment][:receiver_id])
		end

	end
end
