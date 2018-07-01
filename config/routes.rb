WwwDrgcms::Application.routes.draw do
  root :to => "dc_main#page"
  get 'home' => 'dc_main#page'
  
#  get '/blog/:name/:link' => 'dc_main#page', :defaults => { path: 'blog' }
#  get '/blog/:name' => 'dc_main#page', :defaults => { path: 'blog', link: 'all' }
 # get '/news/:link' => 'dc_main#page', :defaults => { path: 'news' }
  
  get '/plugins' => 'dc_main#page', :defaults => { path: 'plugins' }
  get '/plugins/search' => 'plugins#search'
  get '/dc_test' => 'dc_test#index' 

  post '/demo_form/show_result' => 'demo_form#show_result' 
  post '/demo_form/show_pdf' => 'demo_form#show_pdf' 

  DrgCms.routes
  
  get '*path' => 'dc_main#page'  
end
