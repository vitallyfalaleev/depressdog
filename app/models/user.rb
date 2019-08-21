# frozen_string_literal: true

class User < ApplicationRecord
  before_create :confirmation_token
  has_secure_password

  mount_uploader :avatar, ImageUploader

  include Gravtastic

  gravtastic default: 'identicon',
             filetype: :jpg,
             size: 512

  PASSWORD_FORMAT = /\A(?=.*[a-z])/x.freeze
  validates :name, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 6..20 }, format: { with: PASSWORD_FORMAT }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end

  private

  def confirmation_token
    if confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
