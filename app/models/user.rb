class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  mount_uploader :avatar, AvatarUploader
  mount_uploader :image, ImageUploader

  # アカウントページ(※メールアドレスとパスワード表示のページ)のバリデーション
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, on: :create # (on: :createをつけることによりパスワードを作る時だけバリーデーションが起動)

  # プロフィールページ(※アイコン画像と名前と自己紹介表示のページ)のバリデーション
  validates :introduction, length: { maximum: 500 }
    
  def index
   @user = User.find(session[:user_id])
  end

end
