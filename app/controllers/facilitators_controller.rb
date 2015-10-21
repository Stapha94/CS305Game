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
  private
  def facilitator_params
    params.require(:facilitator).permit(:email, :first, :last, :password_digest, :active)
  end
end
