class PluginsController < DcApplicationController

def _del_page
  params[:path] = 'plugins'
  dc_process_default_request
end

end
