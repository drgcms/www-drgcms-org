####################################################################
#
####################################################################
class DcTestController < DcApplicationController

####################################################################
#
####################################################################
def index
  #DcTest.create(ip: request.remote_ip,
  #              data: params[:data])
  #render plain: 'ok'
  files = Dir.foreach("#{Rails.root}/../drg_cms/app/models").inject([]) do |r, model_path|
    name = File.basename(model_path).sub('.rb','')
    name.match('dc_') ? (r << name) : r
  end

  t = Time.now
  #time = Benchmark.ms do
  p Time.now - t
    file = 'dc_site'
    1.upto(100) do
      files.each do |file|
        dc_user_can(2, file)
      end
      p Time.now - t
    end
  #end
  #Rails.cache.clear
  render plain: Time.now - t

end

end
