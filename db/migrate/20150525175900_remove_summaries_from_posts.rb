class RemoveSummariesFromPosts < ActiveRecord::Migration
  def change
    remove_index :posts, column: :summary_id
    remove_column :posts, :summary_id
  end
end
