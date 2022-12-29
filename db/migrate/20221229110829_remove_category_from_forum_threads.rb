class RemoveCategoryFromForumThreads < ActiveRecord::Migration[7.0]
  def change
    remove_column :forum_threads, :category, :string
  end
end
