class VideosController < ApplicationController

 before_filter :authenticate_user!
 load_and_authorize_resource

 def index

 end

 def new
  @video = Video.new
 end

 def create
  @video = Video.new(video_params)
  @video.user_id = current_user.id
  if @video.save
   #redirect_to project_path(@task.project_id), notice: "Successfully added new task"
   redirect_to batch_path(@video.batch_id), notice: "successfully added new video"
  else
   redirect_to batch_path(@video.batch_id), notice: "can't add video"
  end
 end

 def show
   @video = Video.find(params[:id])
   @comment = Comment.new
   @comments = Comment.where("video_id = ?",@video.id)
   @videos = Video.where("batch_id = ?",@video.batch_id)

 end

 def destroy
  @video = Video.find(params[:id])
  @video.content.destroy
  @video.destroy
  redirect_to batch_path(@video.batch_id), notice: "successfully Deleted the Video"
 end


 private
 def video_params
  params[:video].permit(:name,:batch_id,:file_path,:content)
 end

end
