Rails.application.routes.draw do


  get 'auth/login' => 'authentication#login'
  post 'auth/auth_login' => 'authentication#auth_login'
  post 'auth/auth_signin' => 'authentication#auth_signin'
  get 'auth/logout' => 'authentication#logout'

  root 'score_sheet#index'
  get 'score_sheet' => 'score_sheet#index'
  get 'score_sheet/index'
  get 'score_sheet/new'
  get 'score_sheet/edit'
  post 'score_sheet/create'
  patch 'score_sheet/:id/update' => 'score_sheet#update'
  get 'score_sheet/:id/delete' => 'score_sheet#destroy'

  resources :seasons
  resources :games
  resources :members
  get '/season/:season_id/members/no/:jersey_number' => 'members#show_jersey_no'

  # resources :seasons do
  #   resources :games
  # end


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
  #     members do
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
