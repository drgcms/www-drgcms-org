#--
# Copyright (c) 2014+ Damjan Rems
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


########################################################################
# Common renderer holds common rendering methods used by site.
########################################################################
class CommonRenderer
  
########################################################################
# Initialize 
########################################################################
def initialize( parent, opts={} ) #:nodoc:
  @parent   = parent
  @opts     = opts
  @part_css = ''
  self
end

########################################################################
# Renders login link and draws user name an logout link when user is logged in.
########################################################################
def login
  html = if @parent.session[:user_id].nil?
    %Q[ #{@parent.link_to('Login ', {controller: 'dc_common', action: 'login', return_to: @parent.request.url}, class: 'link-middle')} ]
  else
    %Q[
    #{@parent.link_to('Logout ', { controller: 'dc_common', action: 'logout', return_to: @parent.request.url}, class: 'link-middle')}
    #{@parent.session[:user_name]}
]
  end
  html
end

########################################################################
# Return html part
########################################################################
def render_html
  method = @opts[:method] || 'list'
  respond_to?(method) ? send(method) : "Error common_renderer: Method #{method} doesn't exist!"
end

########################################################################
# Return css part
########################################################################
def render_css
  @part_css
end

end
