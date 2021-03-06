class PluginsController < DcApplicationController

####################################################################
# Ajax plugins search call. Return is a json response with list of plugins 
# containing searched string.
####################################################################
def search
  return dc_render_404 unless request.xhr? # ajax only

  plugins = DcPlugin.where(active: true, search:  /#{params[:search]}/).order_by(updated_at: -1).page(params[:page]).per(10)
  html = render_to_string(:partial => 'list', locals: { plugins: plugins })

  result = { '#div_plugins-result' => html }
  render json: result
end

end
