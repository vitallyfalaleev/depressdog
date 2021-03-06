# frozen_string_literal: true

class UserMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    UserMailer.registration_confirmation(User.first)
  end
end
