class Photo < ApplicationRecord
  mount_uploader :photo_url, ImageUploader

  belongs_to :user

  has_many :likes
  has_many :comments

  def like(user)
    likes << Like.create(user: user)
  end

  def unlike(user)
    likes.where(user_id: user.id).first.destroy
  end
end
