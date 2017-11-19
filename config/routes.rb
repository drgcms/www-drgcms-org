WwwDrgcms::Application.routes.draw do
  root :to => "dc_main#page"
  get 'home' => 'dc_main#page'
  
  get '/blog/:name/:link' => 'dc_main#page', :defaults => { path: 'blog' }
  get '/blog/:name' => 'dc_main#page', :defaults => { path: 'blog', link: 'all' }
  get '/news/:link' => 'dc_main#page', :defaults => { path: 'news' }
  
  get '/books/:method/:book_id/', to: 'dc_main#page', :defaults => { path: 'books' }
  get '/books/:method/:book_id/:chapter_id', to: 'dc_main#page', :defaults => { path: 'books' }
  get '/books/:method/:book_id/:chapter_id/:version', to: 'dc_main#page', :defaults => { path: 'books' }
  
#  match '/at_the_beginning/:action'   => 'dc_at_the_beginning#:action'
  get '/page/:id' => 'books#page#:id'

  get '/plugins' => 'dc_main#page', :defaults => { path: 'plugins' }
  get '/plugins/search' => 'plugins#search'
  get '/dc_test' => 'dc_test#index' 

  post '/demo_form/show_result' => 'demo_form#show_result' 
  post '/demo_form/show_pdf' => 'demo_form#show_pdf' 

  DrgCms.routes
  
  get '*path' => 'dc_main#page'  
  
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
