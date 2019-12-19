class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ # 大学ごとの細かいフォーマットのvalidateはJS側で実装する．
  validates :email, presence: true, length: { maximum: 255 },
             format: { with: VALID_EMAIL_REGEX },
             uniqueness: {case_sensitive: false}
  validates :faculty, presence: true, length: { maximum: 50 }
  validates :subject, presence: true, length: { maximum: 50 }
  validates :grade, presence: true, length: { maximum: 50 }
  validates :password, presence: true, length: { minimum: 8 }
  has_secure_password
end
