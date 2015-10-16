class UsersController < ApplicationController
 before_filter :authenticate_user!
 load_and_authorize_resource

 def index
  if is_admin?
   @users = User.all
  end
 end

 def new
  @user = User.new
  @permission = Permission.new
 end

 def create
  @user = User.new(user_params)
  if @user.save
   @permission = Permission.new(permission_params)
   @permission.user_id = @user.id
   if @permission.save
    Notification.user_created(@user).deliver!
    redirect_to users_path, notice: "successfully added new user"
   else
    redirect_to edit_user_path(@user.id),notice: "please select user role before continuing."
   end
  else
   render action: "new"
  end
 end

 def edit
  @user = User.find(params[:id])
  @permission = Permission.find_by_user_id(@user.id)
 end

 def update
  ### dont't forget to add permisson update method here###
  @user = User.find(params[:id])
  @permission = Permission.find_by_user_id(@user.id)
  if @user.update_attributes(user_params) && @permission.update_attributes(permission_params)
   Notification.user_editted(@user).deliver!
   redirect_to root_url, notice: "successfully Editted user"
  else
   render action:"edit"
  end
 end

 def show
  @user = User.find(params[:id])
  @batch_user = BatchUser.where("user_id = ?",@user.id)
 end

 def destroy
  @user = User.find(params[:id])
  @user.destroy
  redirect_to users_path, notice: "successfully Deleted the user"

 end

 private
 def user_params
  params[:user].permit(:firstname,:lastname,:email,:password)
 end

 def permission_params
  params[:permission].permit(:role_id)
 end

end
