Rails.application.routes.draw do
 
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'questions#index'
  get '/users/new', to: 'users#new', as: 'signup'
  get '/sessions/new', to: 'sessions#new', as: 'login'

  resources :users
  resources :sessions

  get 'tags/:tag', to: 'questions#index', as: :tag

  resources :questions do 
    resources :answers, except: [:index,:show,:new]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
