class AddSubtitleToForumCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :forum_categories, :url, :string
    add_column :forum_categories, :subtitle, :string
  end
end
