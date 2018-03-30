class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
	def index
    	@comments = Comment.all.order(:comment)
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

    def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Önskning borttagen'
  end

   private

   def comment_params
        params.require(:comment).permit(:user_id, :comment)
   end

   def set_comment
    @comment = Comment.find(params[:id])
   end
end
