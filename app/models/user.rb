class User < ApplicationRecord
  has_secure_password

  mount_uploader :avatar, ImageUploader

  include Gravtastic

  gravtastic :default => 'identicon',
             :filetype => :jpg,
             :size => 512

  PASSWORD_FORMAT = /\A(?=.*[a-z])/x
  validates :name, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 6..20 }, format: { with: PASSWORD_FORMAT }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
