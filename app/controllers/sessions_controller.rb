# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      p "1" * 1000
      p user
      p "2" * 1000

      if user.email_confirmed
        session[:user_id] = user.id
        redirect_to root_url, notice: 'Logged in!'
      else
        flash.now[:notice] = 'Email not confirmed'
        redirect_to login_path
      end
    else
      flash.now[:notice] = 'Email or password is invalid'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
