Rails.application.routes.draw do
  root :to => "public/homes#top"

  scope module: :public do
    devise_for :users, :controllers =>{
      :registrations => 'public/users/registrations',
      :sessions => 'public/users/sessions'
    }
  end

  namespace :admin do
  end
end
