Crispychicken::Application.routes.draw do
  resources :password_resets
  resources :contact_forms
  get "contact_form/new"
  get "contact_form/create"
  match '/events/public',  to: 'events#public',           via: 'get'

  resources :users, :events, :sessions 
  match '/about',  to: 'information#about',               via: 'get'
  match '/contact',  to: 'contact_forms#new',             via: 'get' , :as => :contact
  match '/thank_you', to: 'users#index',      via: 'post', :as => :thank_you
  resources :sessions do 
   # post 'login'
  end
  
  match '/signup',  to: 'users#new',                      via: 'get'
  match '/signin',  to: 'sessions#new',                   via: 'get'
  match '/signout', to: 'sessions#destroy',               via: [:get, :post]
  match 'auth/:provider/callback', to: 'sessions#login',  via: [:get, :post]
  match 'auth/failure', to: redirect('/'),                via: [:get, :post]
  
  match '/show', to: 'google_places#show',  		          via: 'get'
  match '/set_session', to: 'google_places#set_session',  via: 'get'

  root :to => "users#index"

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
