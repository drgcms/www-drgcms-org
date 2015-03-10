#--
# Copyright (c) 2015+ Damjan Rems
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++


#######################################################################
namespace :plugins do
  desc 'Update dc_plugins collection with data found on RubyGems web site.'
  task :update, [:name] => :environment do |t, args|
    require "net/http"
    DcPlugin.where(active: true).each do |plugin|
#    %w(drg_cms drg_books).each do |plugin|
      uri  = URI.parse("https://rubygems.org/api/v1/gems/#{plugin.name.strip}.json")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      next unless response.code == '200'

      json = JSON.parse(response.body)
      plugin.version = json["version"]
      plugin.authors = json["authors"]
      plugin.info    = json["info"]
      plugin.home_url  = json["homepage_uri"]
      plugin.src_url   = json["source_code_uri"]
      plugin.doc_url   = json["homepage_uri"]
      plugin.save
    end
  end
end
