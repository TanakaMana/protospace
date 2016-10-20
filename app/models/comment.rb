class Comment < ActiveRecord::Base
  belongs_to :prototype, counter_cache: :comments_count
  belongs_to :user
end
