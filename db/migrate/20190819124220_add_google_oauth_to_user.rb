# frozen_string_literal: true

class AddGoogleOauthToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :image_url, :string
    add_column :users, :access_token, :string
  end
end
