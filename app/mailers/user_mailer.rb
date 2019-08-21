# frozen_string_literal: true

class UserMailer < ActionMailer::Base
  default from: 'me@localhost:3000'

  def registration_confirmation(user)
    @user = user
    mail(to: user.email,
         subject: 'Registration Confirmation')
  end
end
