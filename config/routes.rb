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
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  scope module: :public do
    get "/members/my_page" => "members#show"
    get "/members/information/edit" => "members#edit"
    patch "/members/information" => "members#update"
    get "/members/quit" => "members#quit"
    patch "/members/out" => "members#out"
    resources :items, only: [:index, :show]
    resources :shipping_addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :shopping_cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        get 'confirm'
        post 'confirm'
        get 'complete'
      end
    end
  end


  # 管理者側ルーティング
  namespace :admin do
   resources :items, only: [:new, :index, :create, :show, :edit, :update]
   resources :genres, only: [:new, :create, :index, :edit, :update]

  get '/' => 'homes#top'
   resources :members, only: [:index, :show, :edit, :update]
   resources :orders, only: [:show, :update]
   resources :order_items, only: [:update]
  end

  get "search" => "search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
