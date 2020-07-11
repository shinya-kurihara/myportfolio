Rails.application.routes.draw do
  devise_for :users
  root to: 'tweets#index'
  resources :tweets do
    collection do
      get 'search'
    end
    
    collection do
      get 'about'
    end

    collection do
      get 'portfolio'
    end

    collection do
      get 'contact'
    end

    collection do
      get 'photograph'
    end

    collection do
      get 'video'
    end

    collection do
      get 'tweet'
    end

    collection do
      post 'import'
    end
  end
  resources :users, only: :show
end
