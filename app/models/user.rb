class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 1:N の「1(user) 」側にあたるモデルに、has_many を記載する必要がある
  # dependent: :destroyは1:Nの1(user)側が削除されたとき、N側を全て削除する user消えたらpostimageも消える
  # dependent: :destroyが無いとuserが消えてもpostimageは残り続ける
  has_many :post_images, dependent: :destroy
  
  # profile_imageという名前でActiveStorageで
# プロフィール画像を保存できるように設定
  has_one_attached :profile_image
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
