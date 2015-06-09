class ChangeFavoritesColumnType < ActiveRecord::Migration
  def change
    change_column :favorites, :post_id, :integer
    change_column :favorites, :user_id, :integer
  end
end
