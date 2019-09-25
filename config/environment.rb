# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Time::DATE_FORMATS[:ru_datetime] = '%Y.%m.%d в %k:%M:%S'

ActionMailer::Base.smtp_settings = {
    :user_name => 'apikey',
    :password => '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',
    :domain => 'fierce-thicket-29629.herokuapp.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}

