class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url flash[:notice] = "logged in"
    else
      flash.now.alert = "Email or Password is incorrect"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url flash[:notice] = "logged Out"
  end
end
