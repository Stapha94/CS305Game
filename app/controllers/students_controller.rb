class StudentsController < ApplicationController

  before_action :require_facilitator, only: [:create, :new, :remove]

  def home
  end
  def new
    @student = Student.new
  end
  def create
    @student = Student.new(student_params)
    if @student.save
    redirect_to '/facilitator'
    else
    redirect_to '/facilitator/add-Student'
    end
  end
  private
  def student_params
    params.require(:student).permit(:sid)
  end
  def remove
  end
end