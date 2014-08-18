Rails.application.routes.draw do
  root 'food_trucks#index'

  resource :session, only:[:new, :create, :destroy]
  # resources :users
  # resources :food_categories
  # resources :food_trucks

#users paths
  get '/users' => 'users#index', as: :users 
  get '/users/new' => 'users#new', as: :new_user
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show', as: :user
  get '/users/:id/edit' =>  'users#edit', as: :edit_user
  patch '/users/:id' => 'users#update'
  put '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

#food categories paths
  get '/food_categories' => 'food_categories#index', as: :food_categories 
  get '/food_categories/new' => 'food_categories#new', as: :new_food_category
  post '/food_categories' => 'food_categories#create'
  get '/food_categories/:id' => 'food_categories#show', as: :food_category
  get '/food_categories/:id/edit' =>  'food_categories#edit', as: :edit_food_category
  patch '/food_categories/:id' => 'food_categories#update'
  put '/food_categories/:id' => 'food_categories#update'
  delete '/food_categories/:id' => 'food_categories#destroy'

#food trucks paths
  get '/food_trucks' => 'food_trucks#index', as: :food_trucks 
  get '/food_trucks/new' => 'food_trucks#new', as: :new_food_truck
  post '/food_trucks' => 'food_trucks#create'
  get '/food_trucks/:id' => 'food_trucks#show', as: :food_truck
  get '/food_trucks/:id/edit' =>  'food_trucks#edit', as: :edit_food_truck
  patch '/food_trucks/:id' => 'food_trucks#update'
  put '/food_trucks/:id' => 'food_trucks#update'
  delete '/food_trucks/:id' => 'food_trucks#destroy'

#category_to_trucks paths
  get 'category_to_trucks' => 'category_to_trucks#index', as: :category_to_trucks
  post 'category_to_trucks' => 'category_to_trucks#create'
  patch 'category_to_trucks' => 'category_to_trucks#update'
  put 'category_to_trucks' => 'category_to_trucks#update'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
