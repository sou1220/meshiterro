class ApplicationController < ActionController::Base
  # ユーザー登録、ログイン承認等が使われる前に１５行目のconfigure_permitted_parametersメソッド実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # after_sign_in_path_forはDeviseが用意しているメソッドで、サインイン後にどこに遷移するかを設定しているメソッド
  # (resource)という引数には、ログインを実行したモデルのデータ、今回の場合はつまりログインしたUserのインスタンスが格納
  def after_sign_in_path_for(resource)
    post_images_path
  end
  
  # after_sign_out_path_forはサインアウト後にどこに遷移するかを設定するメソッド
  def after_sign_out_path_for(resource)
    about_path
  end
  
  protected
  
   # devise_parameter_sanitizer.permitでユーザー登録sign_upの際にユーザー名nameのデータ操作許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end