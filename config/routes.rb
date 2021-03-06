Rails.application.routes.draw do
  get 'news_feed/top'

  get 'news_feed/home'

  get '/signup', to: 'users#new'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,  only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
