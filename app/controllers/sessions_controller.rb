class SessionsController < ApplicationController
  before_action :authenticate!, only: [:destroy]

  include UsersHelper

  def new
  end

  def create
    user = User.find_by(email: user_params[:email])
               &.authenticate(user_params[:password])

    if user
      cookies.permanent.signed[:id] = user.id
      flash[:success] = "Welcome back #{current_user.username}"
      redirect_to photos_path
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

  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

    # if: previously already logged in with OAuth
    if authentication.user
      user = authentication.user
      authentication.update_token(auth_hash)
      @next = root_url
      @notice = "Signed in!"
    # else: user logs in with OAuth for the first time
    else
      user = User.create_with_auth_and_hash(authentication, auth_hash)
      # you are expected to have a path that leads to a page for editing user details
      @next = edit_user_path(user)
      @notice = "User created. Please confirm or edit details"
    end

    sign_in(user)
    redirect_to photos_path

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
