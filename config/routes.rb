Rails.application.routes.draw do
  get 'user_profiles/show'
  get 'user_profiles/edit'
  get 'user_profiles/update'
  devise_for :users

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :items, only: %i[index show new create destroy] do
    resources :swaps, only: %i[new]
  end
  resources :swaps, only: %i[show create]

  resources :users, only: %i[dashboard]
end
