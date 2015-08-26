class BatchesController < ApplicationController
 before_filter :authenticate_user!
 load_and_authorize_resource

 def index
  @batches = Batch.all
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

  if @batch.update_attributes(batch_student_params)
   #redirect_to clients_path, notice: "Successfully updated the task detail for the client"
   redirect_to batches_path, notice: "successfully Editted batch"
  else
   render action:"edit"
  end
 end

 def show
  @batch = Batch.find(params[:id])
  @users = User.all
  @video = Video.new
  @videos = Video.where("batch_id = ?",@batch.id)
 end

 def destroy
  @batch = Batch.find(params[:id])
  @batch.destroy
  redirect_to :back, notice: "successfully Deleted the user"
 end

 private
 def batch_params
  params[:batch].permit(:name,:description,:start_date,:user_ids=>[])
 end

 def batch_student_params
  params[:batch].permit(:user_ids=>[])
 end


end
