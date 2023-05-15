Rails.application.routes.draw do
  get 'sessions/new'
  root 'posts#index'

  resources :sessions, only: %i[new create destroy]
  resources :authors, only: %i[new create]

  resources :posts do
    resources :comments do
      member do
        patch 'publish'
      end
    end
  end
end
