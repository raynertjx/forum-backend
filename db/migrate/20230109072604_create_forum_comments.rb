class CreateForumComments < ActiveRecord::Migration[7.0]
  def change
    create_table :forum_comments do |t|
      t.string :content
      t.string :author
      t.references :user, null: false, foreign_key: true
      t.references :forum_thread, null: false, foreign_key: true

      t.timestamps
    end
  end
end
