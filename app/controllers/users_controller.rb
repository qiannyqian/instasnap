class UsersController < ApplicationController
  def create
    @user = User.create(user_params)

    if @user.persisted?
      cookies.permanent.signed[:id] = @user.id
      flash[:success] = "You've registered"
      redirect_to root_path
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    @user = current_user
    @photos = current_user.photos.all

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end

end
