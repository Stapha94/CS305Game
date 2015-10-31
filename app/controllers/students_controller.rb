require "csv"

class StudentsController < ApplicationController

  before_action :require_facilitator, only: [:create, :new, :delete, :remove, :index]

  def home
  end
  def index
    @students = Student.all
  end
  def new
    @student = Student.new
    @students = Student.all
  end
  def create
    @student = Student.new(student_params)
    @student.sid.upcase!
    respond_to do |format|
      if Student.exists?(sid: @student.sid)
        @existingstudent = Student.find_by(sid: @student.sid)
        if @existingstudent.enrolled
          flash[:danger] = 'Student already exists'
          format.html { redirect_to '/facilitator' }
        else
          @existingstudent.update_attribute(:enrolled, true)
          flash[:success] = 'Student added!'
          format. html { redirect_to '/facilitator' }
        end
      else
        @student.save
        flash[:success] = 'Student added!'
        format. html { redirect_to '/facilitator' }
      end
    end
  end
  def delete
  end
  def remove
      @newstudent = Student.new(student_params)
      @newstudent.sid.upcase!
      @student = Student.find_by(sid: @newstudent.sid)    
      respond_to do |format|
        if @student.nil? || @student.enrolled == false
          flash[:danger] = 'Could not remove student!'
          format.html { redirect_to '/facilitator' }
        else
          @student.update_attribute(:enrolled, false)
          flash[:success] = 'Student removed!'
          format.html { redirect_to '/facilitator' }
        end
      end	
  end
  private
    def student_params
      params.require(:student).permit(:sid)
    end
end
