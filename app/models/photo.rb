class Photo < ApplicationRecord
  mount_uploader :photo_url, ImageUploader

  belongs_to :user

  has_many :likes
  has_many :comments
end
