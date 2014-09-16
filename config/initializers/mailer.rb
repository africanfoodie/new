ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :domain => "local.drop.me:300",
  :user_name => "here_valid_email_will_come",
  :password => "here_valid_passowrd_will_come",
  :authentication => "plain",
  :enable_starttls_auto => true
}
