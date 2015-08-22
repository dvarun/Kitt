class HomeController < ApplicationController
 before_filter :authenticate_user!

 def index
  if !is_admin?
   @user = User.find(current_user.id)
  end
 end
end
