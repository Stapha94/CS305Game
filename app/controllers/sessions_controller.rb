class SessionsController < ApplicationController
  def new
    if current_admin
      redirect_to '/admin'
    elsif current_facilitator
      redirect_to '/facilitator'
    elsif current_student
      redirect_to '/main-game'
    end
  end
  def createstudent
    if Student.find_by_sid(params[:session][:sid].upcase) == nil
      flash[:danger] = 'Login failed. Check information!'
    else
      @student = Student.find_by_sid(params[:session][:sid].upcase)
    end
    respond_to do |format|
      if @student
        session[:student_id] = @student.id
        format.html {redirect_to '/main-game'}
      else
        flash[:danger] = 'Login failed. Check information!'
        format.html { redirect_to '/student-login' }
      end
    end
  end
  def create
    if Facilitator.find_by_email(params[:session][:email]) == nil && Admin.find_by_email(params[:session][:email]) == nil
      flash[:danger] = 'Login failed. Check information!'
      format.html { redirect_to '/user-login' }
    elsif Facilitator.find_by_email(params[:session][:email]) != nil
      @facilitator = Facilitator.find_by_email(params[:session][:email])
    elsif  Admin.find_by_email(params[:session][:email]) != nil
      @admin = Admin.find_by_email(params[:session][:email])
    end
    respond_to do |format|
      if @facilitator && @facilitator.authenticate(params[:session][:password_digest])
        session[:facilitator_id] = @facilitator.id
        format.html { redirect_to '/facilitator' }
      elsif @admin && @admin.authenticate(params[:session][:password_digest])
        session[:admin_id] = @admin.id
        format.html {redirect_to '/admin'}
      else
        flash[:danger] = 'Login failed. Check information!'
        format.html { redirect_to '/student-login' }
      end
     end
  end
  def destroy
    session[:facilitator_id] = nil
    session[:admin_id] = nil
    session[:student_id] = nil
    redirect_to '/'
  end
end
