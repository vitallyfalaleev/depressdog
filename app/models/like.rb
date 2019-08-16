class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likable, :polymorphic => true
  validates :user_id, uniqueness: { scope: [:likable_type, :likable_id],
                                    message: 'Already liked' }

  def like_ident
    if self.likable.class == Post
      self.likable.id
    else
      self.likable.post_ident
    end
  end
end
