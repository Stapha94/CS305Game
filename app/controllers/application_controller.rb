class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_facilitator
  helper_method :current_admin
  helper_method :current_student

  def current_facilitator
   @current_facilitator ||= Facilitator.find(session[:facilitator_id]) if session[:facilitator_id]
  end
  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  def current_student
    @current_student ||= Student.find(session[:student_id]) if session[:student_id]
  end
  def require_facilitator
    redirect_to '/user-login' unless current_facilitator
  end
  def require_admin
    redirect_to '/user-login' unless current_admin
  end
  def require_student
    redirect_to '/student-login' unless current_student
  end
end
