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
      #redirect_to project_path(@task.project_id), notice: "Successfully added new task"
      redirect_to :back, notice: "successfully added new user"
     else
      render action: "new"
     end

    else
      render action: "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      #redirect_to clients_path, notice: "Successfully updated the task detail for the client"
      redirect_to :back, notice: "successfully Editted user"
    else
      render action:"edit"
    end
  end

  def show
   @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path, notice: "successfully Deleted the user"
  end

  private
  def user_params
    params[:user].permit(:firstname,:lastname,:email,:password)
  end

  def permission_params
   params[:permission].permit(:role_id)
  end

end
