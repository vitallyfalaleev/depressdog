class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likable, :polymorphic => true

  def like_ident
    if self.likable.class == Post
      self.likable.id
    else
      self.likable.post_ident
    end
  end
end
