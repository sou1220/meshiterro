class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
  def create
    # 投稿するデータを PostImage モデルに紐づくデータとして保存する準備をしていてフォームに入力されたデータ(shop_name や caption,image など)が、@post_image に格納
    @post_image = PostImage.new(post_image_params)
    # @post_image.user_idのように、"[モデル名].[カラム名]"という形で繋げることで、保存するカラムの中身を操作可能
    # current_user はdeviseヘルパーメソッド　ログイン中のユーザー情報を取得できる
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  # 投稿データのストロングパラメーター
   private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end