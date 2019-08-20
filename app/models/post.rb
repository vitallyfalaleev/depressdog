class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, :as => :commentable, dependent: :destroy
  has_many :likes, :as => :likable, dependent: :destroy

  validates :title, length: { maximum: 20 }, presence: true
  validates :body, length: { maximum: 5000 }

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images


  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
