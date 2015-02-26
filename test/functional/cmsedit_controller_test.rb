require 'test_helper'

class CmseditControllerTest < ActionController::TestCase

def login
  post '/dc_common/login', 'record[username]' => 'rems', 'record[password]' => 'mojCMS1513'
end
 
test "should get index" do
  login
  get 'index'
  assert_response :success
  p @response
#    assert_not_nil assigns(:posts)
  end
end
