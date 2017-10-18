class LikesController < ApplicationController
  def create
    @user = current_user
    @photo = Photo.find_by(id: params[:photo_id])
    @photo.like(@user)
    flash.now[:success] = "Photo liked"
    respond_to do |f|
      f.js
      f.html { redirect_to photo_path(@photo) }
    end
  end

  def destroy
    @user = current_user
    @photo = Photo.find_by(id: params[:photo_id])
    @photo.unlike(@user)
    flash.now[:danger] = "Photo unliked"
    respond_to do |f|
      f.js
      f.html { redirect_to photo_path(@photo) }
    end
  end
end
