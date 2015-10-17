class FacilitatorController < ApplicationController
  def new
    @facilitator = FacilitatorController.new
  end
  def create
    @facilitator = FacilitatorController.new(facilitator_params)
  end
  private
  def facilitator_params
    params.require(:facilitator).permit(:us, :passkey, :report, :in_charge)
  end
end
