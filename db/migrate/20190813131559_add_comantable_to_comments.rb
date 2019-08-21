# frozen_string_literal: true

class AddComantableToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
    remove_column :comments, :post_id
  end
end
