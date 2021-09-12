class Subject < ApplicationRecord
    belongs_to :post, :optional => true
    has_many :subjects_users, dependent: :destroy
end
