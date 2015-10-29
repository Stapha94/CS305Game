require 'csv'

class FacilitatorsController < ApplicationController
  def new
    @facilitator = Facilitator.new
  end
  def create
    @facilitator = Facilitator.new(facilitator_params)
    if @facilitator.save
      session[:facilitator_id] = @facilitator.id
      redirect_to '/facilitator/add-student'
    else
      redirect_to '/'
    end
  end
  def download
    generate_report
    send_file Rails.root.join('public', 'studentreport.csv')
  end
  private
  def facilitator_params
    params.require(:facilitator).permit(:email, :first, :last, :password_digest, :active)
  end
  private
  def generate_report
    @students = Student.all
    CSV.open("public/studentreport.csv", "wb") do |csv|
      csv << ["id", "SID", "Chapter 1", "Enrolled"]
      @students.each do |s|
        csv << [s.id, s.sid, s.ch1, s.enrolled]      
      end
    end
  end
end
