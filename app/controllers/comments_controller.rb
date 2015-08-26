class CommentsController < ApplicationController

 def new
  @comment = Comment.new
 end

 def create
  @comment = Comment.new(comment_params)
  if @comment.save
   redirect_to :back, notice: "successfully added new comment"
  else
   redirect_to :back, notice: "Could not add comment"
  end
 end


 private
 def comment_params
  params["comment"].permit(:video_id,:user_id,:title,:description)
 end

end
