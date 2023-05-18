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
  get '/' => 'public/homes#top'
  get '/about' => 'public/homes#about'
  


  # 管理者側ルーティング

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
