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
# Rake task will update plugins data from rubygems.org site 
#######################################################################
namespace :chapters do
  desc 'Remove unnecessary css from book chapters'
  task :update, [:name] => :environment do |t, args|
    DcBookChapter.where(active: true).each do |chapter|
      chapter.dc_book_texts.each do |text|
        if text.body.match("font-family: 'DejaVu Sans Mono';")
          text.body = text.body.gsub("font-family: 'DejaVu Sans Mono';",'')
          p chapter.title
          text.save
        end
      end
#      plugin.save
    end
  end
end
