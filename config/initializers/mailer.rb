ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :domain => "localhost:3000",
  :user_name => ENV["EMAIL"], #this should come from applications.yml ENV['user_name']
  :password => ENV["PASSWORD"], #this should come from applications.yml ENV['user_name']
  :authentication => "plain",
  :enable_starttls_auto => true
}
