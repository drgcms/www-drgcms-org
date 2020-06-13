#ruby "2.4"

ENV["RAILS_ENV"] ||= "development"
source 'https://rubygems.org'

gem 'rails', '~> 6'
#gem 'rails', github: 'rails/rails', branch: 'master'
#gem 'activeresource'

gem 'sassc'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'sprockets', '< 4'
gem 'uglifier'      #, '>= 1.0.3'
gem "non-stupid-digest-assets"#, github: 'alexspeller/non-stupid-digest-assets' 

gem 'mongoid'#, '~> 7.0.5' # github: 'mongoid/mongoid'
gem 'mongo_session_store'
gem 'jquery-rails' #, '= 4.0.5'
gem 'jquery-ui-rails'

gem 'kaminari-mongoid'
gem 'kaminari-actionview'

gem 'unicode_utils'
gem 'foundation-rails' #, '~> 5'
gem 'font-awesome-rails'
gem 'spreadsheet'

gem 'bootsnap', require: false

if ENV["RAILS_ENV"] == "development" or ENV["RAILS_ENV"] == "test"
  gem 'puma'
  gem 'byebug'
  gem 'web-console'#, '>= 3.3.0'
  gem 'listen'#, '>= 3.0.5', '< 3.2'  
  
  gem 'drg_cms',                 :path => '../drg_cms'
  gem 'drg_default_html_editor', :path => '../drg_default_html_editor'
  gem 'drg_manual',              :path => '../drg_manual'
  gem 'drg_blog_news_forum',     :path => '../drg_blog_news_forum'
  gem 'drg_rotator',             :path => '../drg_rotator'
  gem 'drg_resources_plugin',    :path => '../drg_resources_plugin'
  gem 'drg_plugin_banka',        :path => '../drg_plugin_banka'
  gem 'drg_examples',            :path => '../drg_examples'
else
  gem 'drg_cms'
  gem 'drg_default_html_editor'
  gem 'drg_manual'
  gem 'drg_rotator'
  gem 'drg_blog_news_forum'
  gem 'drg_resources_plugin'
  gem 'rails_12factor'
  gem 'drg_plugin_banka'
  gem 'drg_examples'
end

if ENV["RAILS_ENV"] == "development"
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem "better_errors"
  gem "binding_of_caller"  
end

if ENV["RAILS_ENV"] == "test"
  gem 'minitest'
  gem 'capybara'
  gem 'selenium-webdriver'
end
