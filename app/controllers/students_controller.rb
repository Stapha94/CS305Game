class StudentsController < ApplicationController
  def home
  end
  def index
    @students = Student.all
  end
  def new
    @student = Student.new
  end
  def create
    @student = Student.new(student_params)
    @student.sid.upcase!
    respond_to do |format|
      if Student.exists?(sid: @student.sid)
        flash[:danger] = 'Student already exists'
        format.html { redirect_to '/facilitator/add-student' }
      else
        @student.save
        flash[:success] = 'Student added!'
        format. html { redirect_to '/facilitator/add-student' }
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
          format.html { redirect_to '/facilitator/remove-student' }
        else
          @student.update_attribute(:enrolled, false)
          flash[:success] = 'Student removed!'
          format.html { redirect_to '/facilitator/remove-student' }
        end
      end	
    end
  end
  private
  def student_params
    params.require(:student).permit(:sid)
  end
end
