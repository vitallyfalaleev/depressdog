class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable, dependent: :destroy
  validates :body, length: { maximum: 500 }

  def post_ident
    if self.commentable.class == Post
      self.commentable.id
    else
      self.commentable.post_ident
    end
  end
end
