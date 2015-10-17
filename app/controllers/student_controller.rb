class StudentController < ApplicationController
  def new
    @student = StudentController.new
  end
  def create
    @admin = StudentController.new(student_params)
  end
  private
  def student_params
    params.require(:student).permit(:usrname, :passkey, :authorized)
  end
end
