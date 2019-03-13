Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/index'
  get '/about', to: 'pages#about', as: 'about'
  resources :articles
  get '/artticles', to: 'articles#index', as: 'articles_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
