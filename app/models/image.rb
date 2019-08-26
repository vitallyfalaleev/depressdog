# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :post
  belongs_to :user

  mount_uploader :image, ImageUploader
  
  # validates_presence_of :image
  # validate :check_max_files
  #
  # private
  # def check_max_files
  #   if image.size > 5
  #     errors.add(:image, "must not contain more than 5 files")
  #   end
  # end
end
