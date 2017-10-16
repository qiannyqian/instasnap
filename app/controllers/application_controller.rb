class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def authenticate!
    unless current_user
      redirect_to root_path
      flash[:danger] = "You need to login first"
    end
  end

  def current_user
    return unless cookies.signed[:id]
    @current_user ||= User.find_by(id: cookies.signed[:id])
  end
  helper_method :current_user 
end
