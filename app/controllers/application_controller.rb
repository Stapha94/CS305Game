class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_facilitator

  def current_facilitator
   @current_facilitator ||= Facilitator.find(session[:facilitator_id]) if session[:facilitator_id]
  end
  def require_facilitator
    redirect_to '/facilitator/login' unless current_facilitator
  end
  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  def require_admin
    redirect_to '/admin/login' unless current_admin
  end
end
