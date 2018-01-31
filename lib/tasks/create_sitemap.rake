#--
# Copyright (c) 2018+ Damjan Rems
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

def clear_url(base, link)
  return link if link.match 'http'
  link = '/' + link unless link[0,1] == '/'
  base + link
end

#######################################################################
#
#######################################################################
def drgcms_org_menu
  DcSimpleMenu.find_by(:dc_site_id => @site._id).dc_simple_menu_items.each do |menu|
    url = @xml.root.add_element 'url'
    url.add_element('loc').add_text( clear_url(@site_name, menu.link))
    url.add_element('lastmod').add_text(Time.now.strftime('%Y-%m-%d'))
    url.add_element('changefreq').add_text('monthly')
  end
end

#######################################################################
#
#######################################################################
def drgcms_news
  DcNews.where(:active => true).each do |news|
    url = @xml.root.add_element 'url'
    url.add_element('loc').add_text( clear_url(@site_name, "/news/#{news.link}"))
    url.add_element('lastmod').add_text(news.updated_at.strftime('%Y-%m-%d'))
    url.add_element('changefreq').add_text('monthly')
  end
end

#######################################################################
#
#######################################################################
def drgcms_blog
  DcBlog.where(:active => true).each do |blog|
    url = @xml.root.add_element 'url'
    url.add_element('loc').add_text( clear_url(@site_name, "/blog/#{blog.created_by_name}/#{blog.link}"))
    url.add_element('lastmod').add_text(blog.updated_at.strftime('%Y-%m-%d'))
    url.add_element('changefreq').add_text('monthly')
  end
end

#######################################################################
#
#######################################################################
def drgcms_books
  DcBook.where(:active => true).each do |book|
    url = @xml.root.add_element 'url'
    url.add_element('loc').add_text( clear_url(@site_name, "/books/toc/#{book.link}"))
    url.add_element('lastmod').add_text(book.updated_at.strftime('%Y-%m-%d'))
    url.add_element('changefreq').add_text('monthly')
    DcBookChapter.where(dc_book_id: book._id, active: true).each do |chapter|
      url = @xml.root.add_element 'url'
      url.add_element('loc').add_text( clear_url(@site_name, "/books/chapter/#{book.link}/#{chapter.link}"))
      url.add_element('lastmod').add_text(chapter.updated_at.strftime('%Y-%m-%d'))
      url.add_element('changefreq').add_text('weekly')
    end
  end
end

#######################################################################
namespace :sitemap do
  desc 'Create sitemap.xml file for search engines.'
  task :create, [:name] => :environment do |t, args|
    @site_name = 'https://www.drgcms.org'
    @site = DcSite.find_by(name: 'www.mysite.com') #  www.drgcms.org
    
    require 'rexml/document'    
    @xml    = REXML::Document.new('<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"></urlset>')
    drgcms_org_menu
    drgcms_news
    drgcms_blog
    drgcms_books
#    
    formatter = REXML::Formatters::Pretty.new(2)
    formatter.compact = true
    File.open(Rails.root.join('public/sitemap.xml'), 'w') { |f| f.write(formatter.write(@xml.root,"")) }    
  end

#  desc 'Enkratno ažuriranje linkov na partnerjih'
#  task :partnerji, [:name] => :environment do |t, args|
#    Partner.all.each {|pa| pa.save!}
# end
end

