class DcTestController < DcApplicationController

####################################################################
#
####################################################################
def index
  DcTest.create(ip: request.remote_ip,
                data: params[:data])
  render text: 'ok'
end

end
