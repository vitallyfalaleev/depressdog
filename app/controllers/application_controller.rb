class ApplicationController < ActionController::Base
  helper_method :current_user

  def user_is_logged_in
    if !session[:user_id]
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



end
