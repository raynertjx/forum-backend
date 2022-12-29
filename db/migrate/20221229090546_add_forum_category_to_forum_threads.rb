class AddForumCategoryToForumThreads < ActiveRecord::Migration[7.0]
  def change
    add_reference :forum_threads, :forum_category, null: false, foreign_key: true
  end
end
