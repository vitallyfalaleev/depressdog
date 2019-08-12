class User < ApplicationRecord
  has_secure_password

  include Gravtastic

  gravtastic

  validates :email, presence: true, uniqueness: true

  has_many :posts
end
