Rails.application.routes.draw do
  get 'recipe_foods/new'
  get 'recipes/index'
  get 'recipes/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  devise_scope :user do
    authenticated :user do
      root :to => 'foods#index', as: :authenticated_root
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :destroy, :show] do
  resources :recipe_foods, only: [:new,:create, :destroy]
  end
  root to: 'foods#index'

end
