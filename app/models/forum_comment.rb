class ForumComment < ApplicationRecord
  belongs_to :user
  belongs_to :ForumThread, optional: true
end
