class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@example.com',
  return_path: 'jasobs10@gmail.com'
  layout 'mailer'
end
