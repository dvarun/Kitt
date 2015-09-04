class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception


 rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, alert: exception.message
 end

 before_filter :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :firstname, :lastname) }
 end

 #### must add if using cancan otherwise no data will get inserted/updated
 	before_filter do
 	  resource = controller_name.singularize.to_sym
 	  method = "#{resource}_params"
 	  params[resource] &&= send(method) if respond_to?(method, true)
 	end
  #### end of important

 def is_admin?
  current_user.roles.pluck(:name).include?("ADMIN") || current_user.roles.pluck(:name).include?("admin")
 end

 def is_student?
  current_user.roles.pluck(:name).include?("STUDENT") || current_user.roles.pluck(:name).include?("student")
 end

end
