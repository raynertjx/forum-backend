class RemoveNumberFromForumCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :forum_categories, :number, :string
    remove_column :forum_categories, :comments_count, :string
  end
end
