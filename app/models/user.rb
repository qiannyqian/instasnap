class User < ApplicationRecord
  has_many :authentications, dependent: :destroy
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :photos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      username: auth_hash["extra"]["raw_info"]["first_name"],
      email: auth_hash["extra"]["raw_info"]["email"],
      password: SecureRandom.hex(10)
    )
    user.authentications << authentication
    return user
  end

  # grab fb_token to access Facebook for user data
  def fb_token
    x = self.authentications.find_by(provider: 'facebook')
    return x.token unless x.nil?
  end

  #Search Users
  def self.search(search)
    where("username ILIKE ?", "%#{search}%")
  end

end
