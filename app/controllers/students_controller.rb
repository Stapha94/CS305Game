class StudentsController < ApplicationController

  before_action :require_facilitator, only: [:create, :new, :remove]

  def home
  end
  def new
    @student = Student.new
  end
  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        flash[:success] = 'Student added!'
        format. html { redirect_to '/facilitator/add-student' }
      else
        flash[:danger] = 'Student already exists'
        format.html { redirect_to '/facilitator/add-student' }
      end
    end
  end
  def delete
  end
  def remove
      @student = Student.find_by(params[:sid])    
      respond_to do |format|
        unless @student.nil? 
          @student.update_attribute(:enrolled, false)
          flash[:success] = 'Student removed!'
          format.html { redirect_to '/facilitator/remove-student' }
        else
          flash[:danger] = 'Could not remove student!'
          format.html { redirect_to '/facilitator' }
        end
      end	
    end
  end
  private
    def student_params
      params.require(:student).permit(:sid)
    end
  