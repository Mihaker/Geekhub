Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do 
    resources :comments
  end

  resources :posts do
    member do
      patch 'publish_comment/:comment_id', action: :publish_comment, as: 'publish_comment'
    end
  end


end
