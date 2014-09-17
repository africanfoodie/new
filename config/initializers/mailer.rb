ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :domain => "local.drop.me:300",
  :user_name => "",
  :password => "",
  :authentication => "plain",
  :enable_starttls_auto => true
}
