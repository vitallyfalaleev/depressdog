# frozen_string_literal: true

class AddUniqToLikes < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, %i[user_id likable_type likable_id], unique: true
  end
end
