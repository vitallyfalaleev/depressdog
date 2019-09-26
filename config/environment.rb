# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Time::DATE_FORMATS[:ru_datetime] = '%Y.%m.%d в %k:%M:%S'

ActionMailer::Base.smtp_settings = {
    :user_name => ENV["GG_USERNAME"],
    :password => ENV["GG_PASSWORD"],
    :domain => ENV["GG_MAIL"],
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}

