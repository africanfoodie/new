class ContactMailer < ActionMailer::Base
  default from: "amrata.baghel@gmail.com"
  def sample_email(user)
     mail(to: "sahil1345@gmail.com", subject: "Hey Sample Buddy") do |format|
      format.text {render :text => "Knock Knock!"}
    end   
  end
end




