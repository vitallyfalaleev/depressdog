class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :likes, :as => :likable, dependent: :destroy

  validates :title, length: { maximum: 20 }, presence: true
  validates :body, length: { maximum: 5000 }

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  # validates_presence_of :images
  # validate :check_max_files

  # def remove_image_at_index(index)
  #   remain_images = images
  #   if index == 0 && images.size == 1
  #     remove_images!
  #   else
  #     deleted_image = remain_images.delete_at(index)
  #     deleted_image.try(:remove!)
  #     images = remain_images
  #   end
  # end
  #
  # private
  # def check_max_files
  #   if images.size > 5
  #     errors.add(:images, "must not contain more than 5 files")
  #   end
  # end

end
