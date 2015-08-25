class BatchUsersController < ApplicationController

 def create
   @batch_users = BatchUser.new(batchuser_params)
   if @batch_users.save
     #redirect_to project_path(@task.project_id), notice: "Successfully added new task"
     redirect_to :back, notice: "successfully added new batch"
   else
     render action: "new"
   end
 end


 def destroy
   @batch_users = BatchUser.find_by(user_id: params[:id])
   @batch_users.destroy
   redirect_to batches_path, notice: "successfully Deleted the user"
 end


 private
 def batchuser_params
  params[:batch_user].permit(:batch_id,:user_id=>[])
 end

end
