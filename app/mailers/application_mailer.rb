class ApplicationMailer < ActionMailer::Base
  default from: %{ "TestGuru" 'support@testguru.com' }
  layout 'mailer'
end
