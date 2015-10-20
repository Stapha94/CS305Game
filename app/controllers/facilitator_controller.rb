class FacilitatorController < ApplicationController
  def new
    @facilitator = FacilitatorController.new
  end
  def find_by_username
    if @facilitator
  end
  def create
    @facilitator = FacilitatorController.new(facilitator_params)
  end
  private
  def facilitator_params
    params.require(:facilitator).permit(:username, :passkey, :report, :in_charge)
  end
end
