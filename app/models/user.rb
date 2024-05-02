class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 1:N の「1(user) 」側にあたるモデルに、has_many を記載する必要がある
  # dependent: :destroyは1:Nの1(user)側が削除されたとき、N側を全て削除する user消えたらpostimageも消える
  # dependent: :destroyが無いとuserが消えてもpostimageは残り続ける
  has_many :post_images, dependent: :destroy
end
