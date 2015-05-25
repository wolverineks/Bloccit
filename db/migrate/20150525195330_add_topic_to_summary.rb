class AddTopicToSummary < ActiveRecord::Migration
  def change
    add_column :summaries, :topic_id, :integer
    add_index :summaries, :topic_id
  end
end
