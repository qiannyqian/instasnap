class LikesController < ApplicationController
  def create
    @user = current_user
    @photo = Photo.find_by(id: params[:photo_id])
    @photo.like(@user)
    redirect_to photo_path(@photo)
  end

  def delete
    @user = current_user
    @photo = Photo.find_by(id: params[:photo_id])
    @photo.unlike(@user)
    redirect_to photo_path(@photo)
  end
end
