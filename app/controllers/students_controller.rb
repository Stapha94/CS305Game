require "csv"

class StudentsController < ApplicationController

  before_action :require_facilitator, only: [:create, :new, :delete, :remove, :index]

  def home
  end
  def game
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
    matches = true
    if/\A\w{4}\d{2}\z/.match(@student.sid) == nil
      matches = false;
    end
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
      elsif matches
        @student.save
        flash[:success] = 'Student added!'
        format. html { redirect_to '/facilitator' }
      else
        flash[:danger] = 'Incorrect SID format'
        format.html { redirect_to '/facilitator' }
      end
    end
  end
  def save
    sid = current_student.sid
    chapter = params[:chapter].to_i
    grade = params[:grade].to_i
    score = params[:score].to_i
    Report.create(sid: sid, chapter: chapter, grade: grade, score: score)
    @student = Student.find_by_sid(current_student.sid)
    if chapter == 1
      if @student.ch1 < grade
        @student.update_attribute(:ch1, grade)
      end
    elsif chapter == 2
      if @student.ch2 < grade
        @student.update_attribute(:ch2, grade)
      end
    elsif chapter == 4
      if @student.ch4 < grade
        @student.update_attribute(:ch4, grade)
      end
    elsif chapter == 6
      if @student.ch6 < grade
        @student.update_attribute(:ch6, grade)
      end
    elsif chapter == 7
      if @student.ch7 < grade
        @student.update_attribute(:ch7, grade)
      end
    end
  end
  def delete
  end
  def remove
      @newstudent = Student.new(student_params)
      matches = true
      if/\w{4}\d{2}/.match(@newstudent.sid) == nil
        matches = false;
      end
      @newstudent.sid.upcase!
      @student = Student.find_by(sid: @newstudent.sid)    
      respond_to do |format|
        if @student.nil? || @student.enrolled == false || !matches
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
