class Room < ApplicationRecord
  belongs_to :micropost
  validates :buyer_id, presence: true
  validates :micropost_id, presence: true
end
