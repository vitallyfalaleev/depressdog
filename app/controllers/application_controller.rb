class ApplicationController < ActionController::Base
  helper_method :current_user

  def owner
    unless current_user.id == @user.id
      redirect_to user_path(@user.id)
    end
  end

  def user_is_logged_in
    unless session[:user_id]
      redirect_to login_path
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def user_is_confirmed
    if !current_user.email_confirmed?
      redirect_to user_path(current_user.id), {notice: 'Please confirm your email'}
    end
  end
end
