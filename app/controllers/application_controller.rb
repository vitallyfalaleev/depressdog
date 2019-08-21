# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  def owner
    redirect_to user_path(@user.id) unless current_user.id == @user.id
  end

  def user_is_logged_in
    redirect_to login_path unless session[:user_id]
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def user_is_confirmed
    unless current_user.email_confirmed?
      redirect_to user_path(current_user.id), notice: 'Please confirm your email'
    end
  end
end
