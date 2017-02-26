class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true

  def self.isFriend (userId, friendId) 
  		user = User.find(userId)
  		return user.list_friends.include?(friendId)
  end
end
