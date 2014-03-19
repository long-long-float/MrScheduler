MrScheduler::Application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { registrations: "users/registrations" }
  
  get 'search' => 'search#search'

  resources :groups do
    resources :tasks do
      resources :comments, only: [:create, :update, :destroy]
      get 'history'
    end

    resource :timetable, only: [:edit, :update] do
      resources :class_changes, only: [:new, :create]
      get 'history'
      post 'rollback'
      get 'edit_detail'
      post 'edit_detail' => 'timetables#update_detail'
    end

    member do
      get 'join' => 'groups#join_authorization'
      post 'join'
    end
  end

  resource :user do
    resources :notifications, only: [:index]
  end

  get 'notify_all' => 'notifications#notify_all'
  get 'read_all' => 'notifications#read_all'

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
