require 'csv'

class FacilitatorsController < ApplicationController

  before_action :require_admin, only: [:create, :remove]
  before_action :require_facilitator, only: [:new, :download, :home]

  def new
    @facilitator = Facilitator.new
  end
  def create
    @facilitator = Facilitator.new(facilitator_params)
    if @facilitator.save
      session[:facilitator_id] = @facilitator.id
      redirect_to '/facilitator'
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
