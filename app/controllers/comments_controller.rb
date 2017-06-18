class CommentsController < ApplicationController
	def index
    	@comments = Comment.all
  	end

  	def show
  	end

  	def new
    	@comment = Comment.new
  	end

  	 def create
       @comment = Comment.new(comment_params)
       if @comment.save! 
       		redirect_to :controller => 'comments', :action => 'index'
       	else
       		render 'new'
       	end
   end

   private

   def comment_params
        params.require(:comment).permit(:user_id, :comment)
   end
end
