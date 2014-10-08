ClubBiz::Application.routes.draw do

  resources :adminevents

  resources :invitations

  resources :societyevents

  resources :societynetworks

  resources :networks

  resources :reports

  resources :admins

  resources :joins

  resources :follows

  resources :annoucements

  resources :tickets



  devise_for :users
  get "welcome/index"
  get "/my_events" => "events#my_events", as: :my_events
  get "/my_societies" => "societies#my_societies", as: :my_societies

  post "join" => "societies#join"
  post "follow" => "societies#follow"
  post "unjoin_net" => "networks#unjoin_net"
  get "unjoin_net" => "networks#unjoin_net"

  post 'events/:id/reserve_ticket' => "events#reserve_ticket", as: :reserve_ticket
  post 'societies/:id/make_admin' => "societies#make_admin", as: :make_admin
  # get 'events/:id/reserve_ticket/:amount' => "events#reserve_ticket", as: :reserve_ticket
  get "societies/following"
  get "societies/unfollow"
  get "societies/joining"
  get "societies/unjoin"
  get "societies/join_net"
  get "societies/unjoin_net"
  get "societies/accept_share"
  get "networks/join_net"
  get "networks/unjoin_net"



  get "events/following"
  get "events/unfollow"
  get "events/joining"
  get "events/unjoin"

  resources :events do 
    resources :comments
  end

  resources :societies do
    resources :join
    resources :comments
  end

  resources :search

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
