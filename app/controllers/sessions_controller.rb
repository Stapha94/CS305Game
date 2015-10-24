class SessionsController < ApplicationController
  def new
  end
  def create
    @facilitator = Facilitator.find_by_email(params[:session][:email])
    respond_to do |format|
      if @facilitator && @facilitator.authenticate(params[:session][:password_digest])
        session[:facilitator_id] = @facilitator.id
        format.html { redirect_to '/facilitator' }
      else
        flash[:danger] = 'Login failed. Check information!'
        format.html { redirect_to '/facilitator/login' }
      end
     end
  end
  def destroy
    session[:facilitator_id] = nil
    redirect_to '/'
  end
end
