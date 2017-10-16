class PhotosController < ApplicationController
  def all
    @photo = Photo.find_by(id: params[:id])
    @user = User.find_by(:id)
  end

  def show
    @photo = Photo.find_by(id: params[:id])
  end

  def create
    @photo = current_user.photos.create(photo_params)

    if @photo.persisted?
      redirect_to photo_path(@photo)
      flash[:success] = "New photo posted"
    else
      render :new
      flash[:danger] = "Error posting photo"
    end

  end

  def update
  end

  def delete
  end

  private

  def photo_params
    params.require(:photo).permit(:user_id, :photo_url, :caption, :created_at, :updated_at)
  end

end
