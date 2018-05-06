class NotifierMailer < ApplicationMailer

  def welcome(user)
    @user = user
    mail(to: user.email, subject: "Welcome to The Book")
  end

end
