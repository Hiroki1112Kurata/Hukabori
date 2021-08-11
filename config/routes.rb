Rails.application.routes.draw do
  root :to => "public/homes#top"

  scope module: :public do
    resources :reports
    devise_for :users, :controllers => {
      :registrations => 'public/users/registrations',
      :sessions => 'public/users/sessions'
    }
  end

  namespace :admin do
    resources :reports, only: [:index, :show, :edit, :update]
    root :to => "homes#top"
  end

  devise_for :admin, controllers: {
    sessions: 'admin/admins/sessions',
  }
end
