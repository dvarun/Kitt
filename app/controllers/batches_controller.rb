class BatchesController < ApplicationController
 before_filter :authenticate_user!
 load_and_authorize_resource
 skip_authorize_resource :only => :batch_videos

 def index
  @batch_ongoing = Batch.where("is_complete = ?",false)
  @batch_completed = Batch.where("is_complete = ?",true)
 end

 def new
  @batch = Batch.new
 end

 def create
  @batch = Batch.new(batch_params)
  if @batch.save
   #redirect_to project_path(@task.project_id), notice: "Successfully added new task"
   redirect_to batches_path, notice: "successfully added new batch"
  else
   render action: "new"
  end
 end

 def edit
  @batch = Batch.find(params[:id])
 end

 def update
  @batch = Batch.find(params[:id])

  if @batch.update_attributes(batch_params)
   redirect_to batches_path, notice: "Successfully editted batch"
  else
   render action:"edit"
  end
 end

 def show
  @batch = Batch.find(params[:id])

  user = [] #declare empty array to store existing user
  for users in @batch.users
   user << users.id
  end
  user << 1 #this one for avoiding the admin user
  @users = User.where("id not in (?)",user)

  #@users = BatchUser.joins(:batch).where("batches.id != ?",@batch.id)
  @video = Video.new
  @videos = Video.where("batch_id = ?",@batch.id)

  @watched_video = WatchedVideo.where("batch_id = ?",@batch.id)
 end

 def destroy
  @batch = Batch.find(params[:id])
  @batch.destroy
  redirect_to :back, notice: "Successfully deleted the user"
 end

 def batch_videos
  if !params[:id].nil?
   @batch = Batch.find(params[:id])
   @video = Video.where("batch_id = ?",@batch.id)
  else
   #return empty array to show there's no video
   @video = []
  end
 end

 private
 def batch_params
  params[:batch].permit(:name,:description,:start_date,:is_complete,:user_ids=>[])
 end

end
