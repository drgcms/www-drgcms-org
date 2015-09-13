require './test/test_helper.rb'
=begin
require 'dc_user'

class CmseditControllerTest < ActionController::TestCase

def login(usr,pwd)
  #post '/dc_common/login', 'record[username]' => 'rems', 'record[password]' => 'mojCMS1513'
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
  login('rems','mojCMS1513')
  
  get :index, table: :dc_user, formname: 'dc_user'
  assert_response :ok
  
  assert_select 'div#.dc-form-frame', 'Should have div dc-form-frame'
  
  assert_select "ul#.dc-action-menu" do
    assert_select "li", 3
  end  
  
#  p @response
 
  p ENV['RAILS_ENV']
end

end

=end