# frozen_string_literal: true

class Comment < ApplicationRecord
  after_create :notify_pusher, on: :create
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :body, length: { maximum: 500 }, presence: true

  def post_ident
    if commentable.class == Post
      commentable.id
    else
      commentable.post_ident
    end
  end
  def notify_pusher
    Pusher.trigger('comments', 'new', self.as_json)
  end
end
