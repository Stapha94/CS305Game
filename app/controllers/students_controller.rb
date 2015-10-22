class StudentsController < ApplicationController
  def home
  end
  def new
    @student = Student.new
  end
  def create
    @student = Student.new(student_params)
   if @student.save
    flash[:success] = 'Student added successfully!'
    format.html { redirect_to '/signup' } 
   else
    flash[:danger] = 'Student already exists'
    format.html { redirect_to '/' }
   end
  end
  private
  def student_params
    params.require(:student).permit(:sid)
  end
end