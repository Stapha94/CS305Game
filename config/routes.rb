Rails.application.routes.draw do
  root 'students#home'
  get '/main-game' => 'students#game'
  get '/facilitator' => 'students#new'
  get '/facilitator?sortbysid' => 'students#new'
  get '/facilitator?sortbych1' => 'students#new'
  get '/facilitator?sortbyreversesid' => 'students#new'
  get '/admin' => 'facilitators#new'
  resources :facilitators
  post '/admin/add-facilitator' => 'facilitators#create'
  post '/admin/remove-facilitator' => 'facilitators#remove'
  get '/gamepage' => 'game#home'
  post '/facilitator/add-student' => 'students#create'
  post '/facilitator/remove-student' => 'students#remove'
  post '/admin/activate-facilitator' => 'facilitator#activate'
  resources :admins, :facilitators
  get '/user-login' => 'sessions#new'
  get '/student-login' => 'sessions#new'
  resources :facilitators, :admins, :students
  post 'loginuser' => 'sessions#create'
  post 'loginstudent' => 'sessions#createstudent'
  resources :admins
  resources :facilitators
  delete 'logout' => 'sessions#destroy'
  get '/facilitator/remove-student' => 'students#delete'
  get '/facilitator/view-students' => 'students#index'
  resources :students
  get '/facilitator/download-report' => 'facilitators#download'
  resources :students


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
