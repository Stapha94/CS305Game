class UserMailer < ApplicationMailer
  default :from => 'jmgacademy@cs.com'

  def welcome_email(facilitator)
    @facilitator = facilitator
    @url = 'jmgacademy.herokuapp.com/facilitator/login'
    mail(:to => facilitator.email, :subject => 'Welcome to JMG Adventures!')
  end
end