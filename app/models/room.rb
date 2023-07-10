class Room < ApplicationRecord
 has_many :reservations, dependent: :destroy
 belongs_to :user

 mount_uploader :image, ImageUploader

  # 施設の新規登録のページのバリデーション
  validates :room_name, presence: true, uniqueness: { scope: :user }
  validates :room_introduction, length: { maximum: 500 }
  validates :price, presence: true
  validates :address, presence: true

end
