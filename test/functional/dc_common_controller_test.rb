require './test/test_helper.rb'

class DcCommonControllerTest < ActionController::TestCase
=begin
def login(usr,pwd)
  #post '/dc_common/login', 'record[username]' => 'rems', 'record[password]' => 'mojCMS1513'
  post :process_login, :record => { username: usr, password: pwd }
end
 
test "should login" do
  
  
  login('arems','mojCMS1513')
  assert_response :redirect
  assert_nil(session[:user_id], "Login should fail")
  
  p @response
  p ENV['RAILS_ENV']
  
  
  
#    assert_not_nil assigns(:posts)
  end

test "should retain session" do
    assert_not_nil(session[:user_id], "Login failed")
  
    p @response
  p '+++'
  p session
#    assert_not_nil assigns(:posts)
  end
=end
end
