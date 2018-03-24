class DcTestController < DcApplicationController

####################################################################
#
####################################################################
def index
  DcTest.create(ip: request.remote_ip,
                data: params[:data])
  render plain: 'ok'
end

end
