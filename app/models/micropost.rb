class Micropost < ApplicationRecord
  belongs_to :user, dependent: :destroy
  default_scope -> { order(updated_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
end
