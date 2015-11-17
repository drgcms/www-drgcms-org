require './test/test_helper.rb'

class CmseditControllerTest < ActionController::TestCase

def login(usr,pwd)
  #post '/dc_common/login', 'record[username]' => 'rems', 'record[password]' => 'secret'
    old_controller = @controller

    # use the login controller
    @controller = DcCommonController.new       # <---

    # perform the actual login
    post :process_login, :record => { username: usr, password: pwd }
#    assert_redirected_to controller: 'cmsedit', action: 'login'
    # check the users's values in the session
    assert_not_nil(session[:user_id], "Login failed")
 
    # restore the original controller
    @controller = old_controller  
end
 
test 'test cmsedit' do

  p DcUser.all.size
  p DcSite.all.size

  login('rems','secret')
  
  get :index, table: :dc_user, formname: 'dc_user'
  assert_response :ok
  
  puts assert_select 'div.dc-form-error'#, 'Should have div dc-form-frame'
  
  assert_select "ul.dc-action-menu" do
    assert_select "li", 3
  end  
  
#  p @response
 
  p ENV['RAILS_ENV']
end

db_clear

end
