class AddUsernameToForumThreads < ActiveRecord::Migration[7.0]
  def change
    add_column :forum_threads, :username, :string
  end
end
