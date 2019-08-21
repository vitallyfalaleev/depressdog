# frozen_string_literal: true

class OauthController < ApplicationController
  def callback
    p '*_begin' * 50

    oauth = OauthService.new(request.env['omniauth.auth'])
    if oauth_account = oauth.create_oauth_account!
      session[:user_id] = oauth_account.id
      redirect_to user_path(oauth_account.id)
    end
  rescue StandardError => e
    flash[:alert] = 'There was an error while trying to authenticate your account.'
    # redirect_to
    render plain: e
  end

  def failure
    flash[:alert] = 'There was an error while trying to authenticate your account.'
    redirect_to signup_path
  end
end
