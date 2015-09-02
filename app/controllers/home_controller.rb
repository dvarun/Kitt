class HomeController < ApplicationController
 before_filter :authenticate_user!

 def index
  if !is_admin?
   @user = User.find(current_user.id)
   @batch_user = BatchUser.find_by(user_id: current_user.id)
   #@batch = Batch.find(@batch_user.batch_id)
   @batches =  Batch.where("id = ?", @batch_user.batch_id)
  end
 end


end
