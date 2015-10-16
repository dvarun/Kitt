ActionMailer::Base.smtp_settings = {
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "gmail.com",
   :authentication => "plain",
   :enable_starttls_auto => true,
   :user_name => "*******@gmail.com",
   :password => "********",
   :openssl_verify_mode  => 'none'
}
## Do set default email from: in notification.rb
