
ruby "2.2.4"

ENV["RAILS_ENV"] ||= "development"

source 'https://rubygems.org'
#source 'http://gems.ozs.si' if ENV["RAILS_ENV"] == "development"

#ENV["RAILS_ENV"] = "production" if ENV["OPENSHIFT_RUBY_VERSION"]

gem 'rails' #, '3.2.13'
gem 'activeresource'
gem 'bcrypt' # , '~> 3.0.0'

gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'uglifier'      #, '>= 1.0.3'
gem "non-stupid-digest-assets"#, github: 'alexspeller/non-stupid-digest-assets' 

gem 'mongoid', '~> 5' # github: 'mongoid/mongoid'
gem 'mongo_session_store-rails4'#, github: 'maisaengineering/mongoid4-session-store'

gem 'jquery-rails'#, '= 4.0.5'
gem 'jquery-ui-rails'

gem 'kaminari'                 
#gem 'therubyracer'
gem 'unicode_utils'
gem 'foundation-rails'#, '~> 5'
gem 'font-awesome-rails'

if ENV["RAILS_ENV"] == "development" or ENV["RAILS_ENV"] == "test"
  gem 'thin'
  gem 'minitest'
  
  gem 'drg_cms', :path => '../drg_cms'
  gem 'drg_default_html_editor', :path => '../drg_default_html_editor'
  gem 'drg_books', :path => '../drg_books'
  gem 'drg_blog_news_forum', :path => '../drg_blog_news_forum'
else
  gem 'puma'
  gem 'drg_cms'
  gem 'drg_default_html_editor'
  gem 'drg_books'
  gem 'drg_blog_news_forum'
  gem 'rails_12factor' #, group: :production
end
