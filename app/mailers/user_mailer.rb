# frozen_string_literal: true

class UserMailer < ActionMailer::Base
  default from: 'vitaly.falaeew@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def registration_confirmation(user)
    @user = user
    mail(to: @user.email,
         subject: 'Registration Confirmation')
  end
end
