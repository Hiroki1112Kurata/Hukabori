Rails.application.routes.draw do
  namespace :public do
  end
  root :to => "public/homes#top"

  scope module: :public do
    get "homes/about" => "homes#about", as: "about"
    get "searches/search"

    get "reports/bookmark" =>"reports#bookmark"
    get "reports/searchpage" =>"reports#searchpage"
    get "reports/rank" =>"reports#rank"
    resources :reports do
      resource :favorites, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
      resources:report_comments, only: [:create, :destroy]
    end

    # お問い合わせ機能ここから
      resources :contacts, only: [:new, :create]
      post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
      post 'contacts/back', to: 'contacts#back', as: 'back'
      get 'done', to: 'contacts#done', as: 'done'
    # お問い合わせ機能ここまで

    devise_for :users, :controllers => {
      :registrations => 'public/users/registrations',
      :sessions => 'public/users/sessions'
    }
    resources :users, only: [:show, :edit, :update]
  end

  namespace :admin do
    resources :reports, only: [:index, :show, :edit, :update]
    resources :departments, only: [:create, :index, :edit, :update]
    resources :users, only: [:index, :edit, :update]
    root :to => "homes#top"
  end

  devise_for :admin, controllers: {
    sessions: 'admin/admins/sessions',
  }
end
