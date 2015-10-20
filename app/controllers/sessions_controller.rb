class SessionsController < ApplicationController
  def new
  end
  def create
    @facilitator = Facilitator.find_by_username(params[:session][:username])
    if @facilitator && @facilitator.authenticate(params[:session][:passkey])
      session[:user_id] = @facilitator.id
      redirect_to '/facilitator'
    else
      redirect_to '/facilitator/login'
    end
  end
end
