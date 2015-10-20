class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
   # @current_user ||= Facilitator.find(session[:user_id]) if session[:userid]
  end
  def require_user
   # redirect_to '/' unless current_user
  end
end
