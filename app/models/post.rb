class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, length: { maximum: 20 }, presence: true
  validates :body, length: { maximum: 5000 }
end
