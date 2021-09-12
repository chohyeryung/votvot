class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :subjects, dependent: :destroy
    has_one_attached :photo
    has_many :likes, dependent: :destroy

    is_impressionable
    def impression_count
        impressions.size
    end
    
    def unique_impression_count
        impressions.group(:ip_address).size.keys.length
    end
    
end
