class Notification < ApplicationMailer
   default from: "******@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.user_created.subject
  #
  def user_created(user)
   @user = user
   user_email_id = user.email
   mail to: "#{user_email_id}",subject: "Account Has been created #{user.firstname + " " + user.lastname}"
  end

  def user_editted(user)
   @user = user
   user_email_id = user.email
   mail to: "#{user_email_id}",subject: "Your Account Has been Editted by Admin: #{user.firstname + " " + user.lastname}"
  end
end
