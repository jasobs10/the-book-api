class NotifierMailer < ApplicationMailer

  def welcome(user)
    @user = user
    mail(to: user.email, subject: "Welcome to The Book")
  end

  def reset_password(user)
    @user = user
    mail(to: user.email, subject: "Your requested password reset")
  end

end
