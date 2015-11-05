class UserMailer < ApplicationMailer
  default from: 'jmgcs@cs.com'

  def welcome_email(facilitator)
    @facilitator = facilitator
    @url = 'jmgcs.herokuapp.com/facilitator/login'
    mail(to: @facilitator.email, subject: 'Welcome to JMG Adventures!')
  end
end
