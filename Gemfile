source 'https://rubygems.org'
source 'http://gems.ozs.si'

ENV["RAILS_ENV"] ||= "development"
#ENV["RAILS_ENV"] = "production" if ENV["OPENSHIFT_RUBY_VERSION"]

gem 'rails' #, '3.2.13'
gem 'activeresource'
gem 'bcrypt' # , '~> 3.0.0'

gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'uglifier'      #, '>= 1.0.3'
gem "non-stupid-digest-assets"#, github: 'alexspeller/non-stupid-digest-assets' 

gem 'mongoid' #, '4.0.0.beta1'# github: 'mongoid/mongoid'
gem 'bson'
gem 'mongo_session_store-rails4'#, github: 'maisaengineering/mongoid4-session-store'

gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'kaminari'                 
#gem 'therubyracer'
gem 'unicode_utils'

if ENV["RAILS_ENV"] == "development"
  gem 'thin'
  gem 'drg_cms', :path => '../drg_cms'
  gem 'drg_default_html_editor', :path => '../drg_default_html_editor'
  gem 'drg_books', :path => '../drg_books'
  gem 'drg_blog_news_forum', :path => '../drg_blog_news_forum'
else
  gem 'drg_cms'
  gem 'drg_default_html_editor'
  gem 'drg_books'
  gem 'drg_blog_news_forum'
  gem 'rails_12factor' #, group: :production
end
