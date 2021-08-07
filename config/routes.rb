Rails.application.routes.draw do
  root :to => "public/homes#top"

  scope module: :public do
  end

  namespace :admin do
  end
end
