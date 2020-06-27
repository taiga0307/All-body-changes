Rails.application.routes.draw do
  root 'customers/homes#top' # トップ画面

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers, controllers: {
    sessions:      'customers/sessions', # 会員ログイン画面
    passwords:     'customers/passwords',
    registrations: 'customers/registrations' # 会員登録画面、会員パスワード編集画面
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'customers/mypage' => 'customers#mypage' # マイページ画面
    get 'customers/withdraw' => 'customers#withdraw'# 会員退会画面
    patch 'customers/withdraw' => 'customers#withdraw_update'
    get 'customers/fix' => 'customers#fix'
    patch 'customers/fix' => 'customers#fix_update'

  namespace :customers do

    get 'homes/about' => 'homes#about' #アバウト画面

    get 'searches/search' => 'searches#search' # 検索画面

    resources :genres, only: [:show] #ジャンルページ

    post 'contacts/confirm' => 'contacts#confirm'# お問い合わせ確認画面
    get 'contacts/thanks' => 'contacts#thanks'# お問い合わせサンクス画面
    resources :contacts, only: [:index, :create, :new] # お問い合わせ履歴一覧画面、お問い合わせ入力画面

    resources :products, only: [:index, :show] do # 商品一覧画面、商品詳細画面　ジャンル一覧は商品一覧と一緒
      resources :product_comments, only: [:create, :destroy] # 商品のコメント保存、削除
      resource :product_favorites, only:[:create, :destroy] # 商品のお気に入り保存、削除
    end
    resources :product_favorites, only: [:index] # 商品お気に入り一覧画面
    resources :product_comments, only: [:index] # 商品コメント一覧画面

    resources :gyms, only: [:index, :show] do # 施設一覧画面、商品詳細画面　ジャンル一覧は施設一覧と一緒
      resources :gym_comments, only: [:create, :destroy] # 施設のコメント保存、削除
      resource :gym_favorites, only:[:create, :destroy] # 施設のお気に入り保存、削除
    end
    resources :gym_favorites, only: [:index] # 施設お気に入り一覧画面
    resources :gym_comments, only: [:index] # 施設コメント一覧画面
    post 'reservations/confirm' => 'reservations#confirm'# 施設予約確認画面
    get 'reservations/thanks' => 'reservations#thanks'# 施設予約サンクス画面
    resources :reservations, only: [:index, :show, :create, :new]# 施設予約履歴一覧画面、施設予約履歴詳細画面、施設予約保存、施設予約入力画面

  end
end
