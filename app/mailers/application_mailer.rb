class ApplicationMailer < ActionMailer::Base
  default from: "Tomify <notify@tomify.me>"
  layout "mailer"
end
