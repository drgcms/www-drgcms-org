#--
# Copyright (c) 2013+ Damjan Rems
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
#
########################################################################
class PluginsRenderer
include DcApplicationHelper

########################################################################
#
########################################################################
def initialize( parent, opts={} )
  @parent   = parent
  @opts     = opts
  @part_css = ''
  self
end

#########################################################################
# Show one plugin
#########################################################################
def show
  html = ''
  plugin = DcPlugin.find(@parent.params[:p_id])
  html << @parent.render( partial: 'plugins/show', locals: { plugin: plugin }, formats: [:html] )
end

#########################################################################
# List all plugins
#########################################################################
def list
  html = ''
  if @parent.session[:user_id]
    html << dc_link_for_create({ controller: 'cmsedit', table: 'dc_plugin', formname: 'dc_plugin_edit',
            title: t('dc_plugin.new_plugin', 'Create new plugin!'), target: 'iframe_edit' }) 
  end
  plugins = DcPlugin.where(active: true).order_by('updated_at desc').page(@parent.params[:page]).per(10)
  html << @parent.render( partial: 'plugins/index', locals: { plugins: plugins }, formats: [:html] )
end

#########################################################################
# render html
########################################################################
def render_html
  method = @parent.params[:method] || 'list'
  respond_to?(method) ? send(method) : "Error Plugins: Method #{method} doesn't exist!"
end

########################################################################
#
########################################################################
def render_css
  ''
end

end
