Rails.application.routes.draw do
  

  get 'photos/index'

  get 'moments' => 'events#index'
  get 'moments/:id' => 'events#show'
  post 'moments/with/:child_id/:event_id' => 'events#create_member'
  patch 'moments/:id' => 'events#update'
  put 'moments/:id' => 'events#update'
  delete 'moments/without/:child_id/:event_id' => 'events#destroy_member'
  # post 'children/create'

  # get 'children/destroy'
  get 'children/born' => 'children#new'


  get 'family' => 'main#index'
  get 'family/tree' => 'main#tree'
  get 'signup' => 'users#new'

  # post 'users/create'
  post 'sessions/create'
  
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :children
  resources :events
  resources :photos
  root 'welcome#index' # (or root :to => 'welcome#index' in Rails < 4)
  get 'home', :to => "welcome#index" # (/home redirects to index page)

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
