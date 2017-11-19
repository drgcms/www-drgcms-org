
#ruby "2.2.4"

ENV["RAILS_ENV"] ||= "development"

source 'https://rubygems.org'
#source 'http://gems.ozs.si' if ENV["RAILS_ENV"] == "production"

#ENV["RAILS_ENV"] = "production" if ENV["OPENSHIFT_RUBY_VERSION"]

gem 'rails' #, '~> 4'
gem 'activeresource'
#gem 'bcrypt' # , '~> 3.0.0'

gem 'sass-rails'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'uglifier'      #, '>= 1.0.3'
#gem "non-stupid-digest-assets"#, github: 'alexspeller/non-stupid-digest-assets' 

gem 'mongoid', '= 6.1.0' # github: 'mongoid/mongoid'
gem 'mongo_session_store-rails5'#, github: 'maisaengineering/mongoid4-session-store'
gem 'jquery-rails' #, '= 4.0.5'
gem 'jquery-ui-rails'

gem 'kaminari-mongoid'
gem 'kaminari-actionview'

gem 'unicode_utils'
gem 'foundation-rails' #, '~> 5'
gem 'font-awesome-rails'
gem 'listen'

if ENV["RAILS_ENV"] == "development" or ENV["RAILS_ENV"] == "test"
  gem 'thin'
  gem 'minitest'
  
  gem 'drg_cms', :path => '../drg_cms'
  gem 'drg_default_html_editor', :path => '../drg_default_html_editor'
  gem 'drg_books', :path => '../drg_books'
  gem 'drg_blog_news_forum', :path => '../drg_blog_news_forum'
  gem 'drg_scorm', :path => '../drg_scorm'
else
  gem 'drg_cms'
  gem 'drg_default_html_editor'
  gem 'drg_books'
  gem 'drg_blog_news_forum'
  gem 'rails_12factor' #, group: :production
end
