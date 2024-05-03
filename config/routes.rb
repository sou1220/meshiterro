Rails.application.routes.draw do
  root 'homes#top'
  resources :post_images, only:[:new, :create, :index, :show, :destroy]
  devise_for :users
  get "homes/about" => "homes#about", as: "about"
  resources :users,only: [:show, :edit]
end
