class Room < ApplicationRecord
 has_many :reservations, dependent: :destroy
 belongs_to :user

 mount_uploader :image, ImageUploader

  # 施設の新規登録のページのバリデーション
  validates :name, presence: true, uniqueness: { scope: :user }
  validates :room_introduction, length: { maximum: 1000 }
  validates :price, presence: true
  validates :address, presence: true

end
