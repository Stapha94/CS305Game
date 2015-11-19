require 'csv'

class FacilitatorsController < ApplicationController

  before_action :require_admin, only: [:new, :create, :remove]
  before_action :require_facilitator, only: [:download]

  def new
    @facilitator = Facilitator.new
  end
  def create
    @facilitator = Facilitator.new(facilitator_params)
    if @facilitator.save
      UserMailer.welcome_email(@facilitator).deliver
      flash[:success] = 'Facilitator Added'
      redirect_to '/admin'
    else
      flash[:danger] = 'Passwords Did Not Match'
      redirect_to '/admin'
    end
  end
  def download
    generate_report
    send_file Rails.root.join('public', 'studentreport.csv')
  end
  private
  def facilitator_params
    params.require(:facilitator).permit(:email, :first, :last, :password, :password_confirmation)
  end
  private
  def generate_report
    @students = Student.order(:sid)
    CSV.open("public/studentreport.csv", "wb") do |csv|
      csv << ["SID", "Chapter 1", "Enrolled"]
      @students.each do |s|
        csv << [s.sid, s.ch1, s.enrolled]      
      end
    end
  end
  def remove
  end
end
