class Like < ApplicationRecord
  belongs_to :post, counter_cache: true
  #Post.find_each { |post| Post.reset_counters(post.id, :likes) }
  belongs_to :user
end
