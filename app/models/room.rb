class Room < ApplicationRecord
  belongs_to :micropost, dependent: :destroy
  belongs_to :buyer, class_name: "User"
  validates :buyer_id, presence: true
  validates :micropost_id, presence: true
end
