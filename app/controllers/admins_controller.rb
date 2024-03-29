class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      session[:admin_id] = @admin.id
      redirect_to '/facilitator/add-student'
    else
      redirect_to '/'
    end
  end
  private
  def admin_params
    params.require(:admin).permit(:email, :passkey, :first, :last, :active)
  end
end
