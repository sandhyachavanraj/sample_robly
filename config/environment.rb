# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SampleApp::Application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => "adam.robinson@robly.com",
    :password => "myob2kfa",
    :domain => "www.robly.com",
    :address => "smtp.sendgrid.net",
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}
