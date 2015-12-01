require 'csv'

class FacilitatorsController < ApplicationController

  before_action :require_admin, only: [:new, :create, :remove]
  before_action :require_facilitator, only: [:download]

  def new
    @facilitator = Facilitator.new
  end
  def create
    @facilitator = Facilitator.new(facilitator_params)
    if Facilitator.exists?(email: @facilitator.email)
      respond_to do |format|
      flash[:danger] = 'Facilitator already exists!'
      format.html { redirect_to '/admin' }
      end
    elsif @facilitator.save
      respond_to do |format|
        UserMailer.welcome_email(@facilitator).deliver
        flash[:success] = 'Facilitator Added!'
        format.html { redirect_to '/admin' }
        end
    else
      respond_to do |format|
        flash[:danger] = 'Passwords Did Not Match!'
        format.html { redirect_to '/admin' }
      end
    end
    end
  def remove
    @newfacilitator = Facilitator.new(facilitator_params)
    @facilitator = Facilitator.find_by(email: @newfacilitator.email)
    respond_to do |format|
      if @facilitator.nil? || @facilitator.active == false
        flash[:danger] = 'Facilitator does not exist!'
        format.html { redirect_to '/admin' }
      else
        @facilitator.update_attribute(:active, false)
        flash[:success] = 'Facilitator removed!'
        format.html { redirect_to '/admin' }
      end
    end
  end
  def activate
    @newfacilitator = Facilitator.new(facilitator_params)
    @facilitator = Facilitator.find_by(email: @newfacilitator.email)
    respond_to do |format|
      if @facilitator.nil? || @facilitator.active == true
        flash[:danger] = 'Facilitator does not exist or is already active!'
        format.html { redirect_to '/admin' }
      else
        @facilitator.update_attribute(:active, true)
        flash[:success] = 'Facilitator reactivated!'
        format.html { redirect_to '/admin' }
      end
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
end
