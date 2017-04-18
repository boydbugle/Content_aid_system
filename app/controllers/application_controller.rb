class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in?
    current_user
  end

  def must_login?
    if !logged_in?
      flash[:alert]= "you must be logged"
      redirect_to root_path
    end
  end
end
