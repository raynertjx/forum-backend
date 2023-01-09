class ForumComment < ApplicationRecord
  belongs_to :user
  belongs_to :ForumThread
end
