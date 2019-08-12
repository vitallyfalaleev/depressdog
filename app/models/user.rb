class User < ApplicationRecord
  has_secure_password

  include Gravtastic

  gravtastic

  PASSWORD_FORMAT = /\A
  (?=.*[a-z])        # Must contain a lower case character
/x

  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 6..20 },
            format: { with: PASSWORD_FORMAT }

            has_many :posts, dependent: :destroy
end
