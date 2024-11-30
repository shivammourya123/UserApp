class AddLikesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :count_check, :boolean, default: false
    add_column :posts, :likeable_ids, :text
    add_column :posts, :total_count, :integer, default: 0
  end
end
