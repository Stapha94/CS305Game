class SessionsController < ApplicationController
  def new
  end
  def create
    @facilitator = Facilitator.find_by_email(params[:session][:email])
    if @facilitator && @facilitator.authenticate(params[:session][:password])
      session[:facilitator_id] = @facilitator.id
      redirect_to '/facilitator'
    else
      redirect_to '/facilitator/login'
    end
  end
  def destroy
    session[:facilitator_id] = nil
    redirect_to '/'
  end
end
