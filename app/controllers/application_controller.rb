class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :user_logged_in?
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def authenticate!
    unless current_user.present?
      redirect_to root_path, alert: "Please login first."
    end
  end
  
  def user_logged_in?
    current_user.present?
  end
  
  def authorize!
    unless current_user.is_admin?
      redirect_to root_path, alert: "You are not authorized to do this action."
    end
  end
  
end
