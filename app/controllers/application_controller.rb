class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def require_login
    redirect_to '/' if session[:user_id] == nil
  end
  def require_logout
    redirect_to '/family' if session[:user_id] != nil
  end
  def logged_in_user
    if session[:user_id] != nil
        @user = User.find(session[:user_id])
    end
  end
end
