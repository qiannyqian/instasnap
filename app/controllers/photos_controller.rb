class PhotosController < ApplicationController
  def all
    @photo = Photo.find_by(id: params[:id])
  end

  def show
    @photo = Photo.find_by(id: params[:id])
  end

  def create
    byebug
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
    params.require(:photo).permit(:user_id, :photo, :caption, :created_at, :updated_at)
  end

end
