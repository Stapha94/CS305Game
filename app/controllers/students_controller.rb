class StudentsController < ApplicationController
  def home
  end
  def new
    @student = Student.new
  end
  def create
    @student = Student.new(student_params)
    if @student.save
    redirect_to '/'
    else
    redirect_to '/signup'
    end
  end
  private
  def student_params
    params.require(:student).permit(:sid, :enrolled)
  end
end