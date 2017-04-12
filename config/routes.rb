Rails.application.routes.draw do
 
root to: 'questions#index'

  resources :tags do
    resources :questions
  end

  resources :questions do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
