class AddForeignKeysToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :post_id, :boolean
    add_column :favorites, :user_id, :boolean
    add_index :favorites, :post_id
    add_index :favorites, :user_id
  end
end
