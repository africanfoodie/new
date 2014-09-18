ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :domain => "localhost:3000",
  :user_name => "emtestrails@gmail.com", #this should come from applications.yml ENV['user_name']
  :password => "testingrails", #this should come from applications.yml ENV['user_name']
  :authentication => "plain",
  :enable_starttls_auto => true
}
