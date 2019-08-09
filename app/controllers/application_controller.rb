class ApplicationController < ActionController::Base
  helper_method :current_user

  def flash_class(level)
    case level
    when :success then "ui green message"
    when :error then "ui red message"
    when :notice then "ui blue message"
    end
  end

  def current_user
    if session[:user_id]
      # @current_user ||= nil
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
