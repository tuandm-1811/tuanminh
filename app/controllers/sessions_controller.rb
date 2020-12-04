class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:error] = "That email and password combination isn't correct."
      render 'new'
    end
  end
    def new
    end
    def destroy
      session[:user_id] = nil
      redirect_to 'signin'
    end
end