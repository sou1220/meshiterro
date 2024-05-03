class PostImage < ApplicationRecord
  # PostImage モデルには、ActiveStorage を使って画像を持たせる
  has_one_attached :image
  # 1:N の「N(postimage)」側にあたるモデルに、belongs_to を記載する必要がある
  belongs_to :user
  
#   画像が設定されない場合はapp/assets/imagesに格納されている
# no_image.jpgという画像をデフォルト画像としてActiveStorageに格納し、格納した画像を表示
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
end
