Rails.application.routes.draw do
 
  get 'sessions/new'

  mount Ckeditor::Engine => '/ckeditor'
  root to: 'questions#index'
  get '/users/new', to: 'users#new', as: 'signup'
  get '/sessions/new', to: 'sessions#new', as: 'login'

  resources :users
  resources :sessions

  get 'tags/:tag', to: 'questions#index', as: :tag

  resources :questions 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
