Rails.application.routes.draw do
  get 'shoping_list/index'
  get 'recipe_foods/new'
  get 'recipes/index'
  get 'recipes/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  devise_scope :user do
    authenticated :user do
      root :to => 'foods#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'recipes#public_recipes', as: :unauthenticated_root
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :destroy, :show] do
  resources :recipe_foods, only: [:new,:create, :destroy]
  end
  resources :shoping_list, only: [:index]

  get '/public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'

end
