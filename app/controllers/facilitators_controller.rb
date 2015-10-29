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
      redirect_to '/facilitator/add-student'
    else
      redirect_to '/'
    end
  end
<<<<<<< HEAD
=======
  def download
    generate_report
    send_file Rails.root.join('public', 'studentreport.csv')
  end
>>>>>>> d8983be8361c68a72d848e4be544ed00cdec421e
  private
  def facilitator_params
    params.require(:facilitator).permit(:email, :first, :last, :password_digest, :active)
  end
<<<<<<< HEAD
=======
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
  def remove
  end
>>>>>>> d8983be8361c68a72d848e4be544ed00cdec421e
end
