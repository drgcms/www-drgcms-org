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

def check_for_replies(collection, days=100)
  collection.all.each do |document|
    title = document.respond_to?(:title) ? :title : :subject
#    p collection.class, document[title]
    document.dc_replies.each do |reply|
      if reply.created_at > days.days.ago
        p [document[title], reply.subject, reply.created_at]
#        reply.delete
      end
    end
  end
end

#######################################################################
# This was when I needed to update source data, which was generated
# by netbeans. 
#######################################################################
namespace :utilities do
  desc 'Remove unnecessary css from book chapters'
  task :remove_font_from_books, [:name] => :environment do |t, args|
    DcBookChapter.where(active: true).each do |chapter|
      chapter.dc_book_texts.each do |text|
        if text.body.match("font-family: 'DejaVu Sans Mono';")
          text.body = text.body.gsub("font-family: 'DejaVu Sans Mono';",'')
          p chapter.title
          text.save
        end
      end
    end
  end

  desc 'List news, blogs replies from last day, week, ..'
  task :list_replies, [:name] => :environment do |t, args|
    days = ARGV[1].split('=').last.to_i
    check_for_replies(DcBookChapter,days)
    check_for_replies(DcNews,days)
    check_for_replies(DcBlog,days)
  end

end
