class BatchUsersController < ApplicationController

 def create
  #@batch_users = BatchUser.new(batchuser_params)
  @batch_users = BatchUser.new(batchuser_params)

  if @batch_users.save
   redirect_to batches_path, notice: "successfully added new student"
  else
   render action: "new"
  end
 end


 def destroy
  @batch_users = BatchUser.find_by(user_id: params[:id])
  @batch_users.destroy
  redirect_to batches_path, notice: "successfully Deleted the user"
 end

 def add_user_in_batch
  @batch_user = BatchUser.new
  @batch_user.batch_id = params[:batch_id]
  @batch_user.user_id = params[:user_id]
  if @batch_user.save
   respond_to do |format|
				format.html {redirect_to batches_path, notice: "successfully added new student"}
				format.js {render 'batches/add_user_in_batch.js.erb'}
			end
  else
   render action: "new"
  end
 end

 def delete_user_in_batch
  @batch_user = BatchUser.where("batch_id = ? AND user_id= ?",params[:batch_id],params[:user_id])
  @batch_user.destroy_all
   redirect_to batch_path(params[:batch_id]), notice: "successfully Deleted the user"
 end


 private
 def batchuser_params
  params[:batch_user].permit(:batch_id,:user_id=>[])
 end

end
