class ContactMailer < ActionMailer::Base
  default from: "amrata.baghel@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.message.subject
  #
  
    # def message(message)
    # subject    message.subject
    # body       :message => message
    # recipients CONTACT_RECIPIENT
    # from       message.email
    # sent_on    Time.now
    # end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.message.subject
  #

def deliver_message(user)
  # @message = message
  # mail(subject: message.subject, body: message.body, recipients: CONTACT_RECIPIENT, from: message.email, sent_on: Time.now)
 end

  end




