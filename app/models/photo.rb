class Photo < ApplicationRecord
  belongs_to :users
  
  has_many :likes
  has_many :comments
end
