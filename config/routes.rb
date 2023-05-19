Rails.application.routes.draw do
  # 会員側deviseルーティング
  devise_for :members, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # 管理者側deviseルーティング
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #会員側ルーティング


  # 管理者側ルーティング
  namespace :admin do
   resources :items, only: [:new, :create] 
   resources :genres, only: [:new, :create, :index, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
