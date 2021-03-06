Rails.application.routes.draw do


  devise_for :profiles
  resources :messages

  resources :subscriptions, only: [:new, :create, :show, :destroy] do
    collection do
      get :payments
      get :cards
    end
  end
  #gives standard routes


  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  # namespace :admin do
  # get 'dashboard/index'
  # end
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :users, :only => [:update]
#  devise_for :users
  # devise_for :users
  resources :products do 
  resources :orders, only: [:new, :create]


  #tells rails needs product id number
end

  # get 'pages/payment'

  get 'home/about'

  get 'messages/new'

  get 'seller' => "products#seller"

  get 'sales' => "orders#sales"

  get 'static_pages/productlanding'

  get "content/veg"

  get "content/fruit"

  get "content/mix"

  get 'subscriptions/new'

  get 'subscriptions/history'

  get 'subscriptions/rewards'

  get 'static_pages/about'

  get 'static_pages/blog'

  get 'static_pages/careers'

  get 'static_pages/faq'

  get 'static_pages/terms'

  get 'static_pages/how'

  get 'users/show'


  
 

#this will create a route helper that generates a URL and hands off the request to a controller



  # get 'pages/user'

  # # get 'pages/order'

  # get 'pages/subscription'

  root 'static_pages#home'

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