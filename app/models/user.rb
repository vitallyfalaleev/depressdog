class User < ApplicationRecord
  has_secure_password

  include Gravtastic

  gravtastic

  PASSWORD_FORMAT = /\A(?=.*[a-z])/x
  validates :name, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 6..20 }, format: { with: PASSWORD_FORMAT }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
