Rails.application.routes.draw do
  root 'posts#index'
  resources :authors, only: %i[new create edit update show]
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :posts do
    resources :comments do
      member do
        patch 'publish'
      end
    end
  end
end
