Rails.application.routes.draw do
 
  root to: 'questions#index'

  get 'tags/:tag', to: 'questions#index', as: :tag

  resources :questions 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
