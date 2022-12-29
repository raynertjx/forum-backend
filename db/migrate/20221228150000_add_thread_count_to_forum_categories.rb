class AddThreadCountToForumCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :forum_categories, :thread_count, :integer
  end
end
