class SessionsController < ApplicationController
  before_action :authenticate!, only: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: user_params[:email])
               &.authenticate(user_params[:password])

    if user
      cookies.permanent.signed[:id] = user.id
      flash[:success] = "Welcome back #{current_user.username}"
      redirect_to root_path
    else
      flash[:danger] = "Error logging in"
      redirect_to new_sessions_path
    end

  end

  def destroy
    cookies.delete(:id)
    flash[:success] = "You've been logged out"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
