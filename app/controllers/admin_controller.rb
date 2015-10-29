class AdminController < ApplicationController
  def new
    @admin = AdminController.new
  end
  def create
    @admin = AdminController.new(admin_params)
  end
  private
  def admin_params
    params.require(:admin).permit(:usrname, :passkey, :authorized)
  end
end
