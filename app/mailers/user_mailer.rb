class UserMailer < ApplicationMailer
  default from: 'abhishek.rathour@ksolves.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    #Notifier.delay.signup(@user)
  end
end
