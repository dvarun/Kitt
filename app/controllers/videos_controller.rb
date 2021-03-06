class VideosController < ApplicationController

 before_filter :authenticate_user!
 load_and_authorize_resource

 def index
  @videos = Video.all
 end

 def new
  @video = Video.new
 end

 def create
  @video = Video.new(video_params)
  @video.user_id = current_user.id
  if @video.save
   #@video.convert
   #redirect_to project_path(@task.project_id), notice: "Successfully added new task"
   redirect_to batch_path(@video.batch_id), notice: "successfully added new video"
  else
   redirect_to batch_path(@video.batch_id), notice: "can't add video"
  end
 end

 def show
  @video = Video.find(params[:id])

  #if it's admin then let the admin watch video
  if !is_admin?
  @batch_user = BatchUser.where("user_id = ? and batch_id = ?",current_user.id,@video.batch_id)
   if @batch_user.empty?
    redirect_to root_url,notice: "The Video doesn't exist"
   end
  end
  #end of admin validation

  #add user detail who wathed this video
  @check_user = WatchedVideo.where("user_id = ? and video_id=? and batch_id=?",current_user.id,@video.id,@video.batch_id)
  if @check_user.empty?
   @watched_video = WatchedVideo.new
   @watched_video.user_id = current_user.id
   @watched_video.video_id = @video.id
   @watched_video.batch_id = @video.batch_id
   @watched_video.save
  end
  #end add user detail
  @comment = Comment.new
  @comments = Comment.where("video_id = ?",@video.id)
  @videos = Video.where("batch_id = ?",@video.batch_id)
 end

 def destroy
  @video = Video.find(params[:id])
  @video.content.destroy
  @video.destroy
  @wv = WatchedVideo.where("video_id = ?",@video.id)
  @wv.delete_all
  redirect_to batch_path(@video.batch_id), notice: "successfully Deleted the Video"
 end


 def edit
  @video = Video.find(params[:id])
 end

 def update
  @video = Video.find(params[:id])
  if @video.update_attributes(video_params)
   #redirect_to clients_path, notice: "Successfully updated the task detail for the client"
   redirect_to batch_path(@video.batch_id), notice: "successfully updated Video"
  else
   render action:"edit"
  end
 end


 private
 def video_params
  params[:video].permit(:name,:batch_id,:file_path,:content)
 end

end
