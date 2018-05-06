# Preview all emails at http://localhost:3000/rails/mailers/notifier_mailer
class NotifierMailerPreview < ActionMailer::Preview
  def welcome
    user = OpenStruct.new(email: "demo@example.com", username: "John Doe")
    NotifierMailer.welcome(user)
  end
end
