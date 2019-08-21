# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likable, polymorphic: true

  validates :user_id, uniqueness: { scope: %i[likable_type likable_id],
                                    message: 'Already liked' }
  def like_ident
    if likable.class == Post
      likable.id
    else
      likable.post_ident
    end
  end
end
