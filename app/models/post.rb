class Post < ApplicationRecord
  belongs_to :user

  validates :title, length: { maximum: 20 }
  validates :body, length: { maximum: 5000 }
end
