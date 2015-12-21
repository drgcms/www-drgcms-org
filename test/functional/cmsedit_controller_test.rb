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
    # check the user_id value in the session
 
    # restore the original controller
    @controller = old_controller  
end
 
#######################################################################
test 'test login' do

  #DcPermission.all.each {|dc| p '*', dc.dc_policy_rules.to_a }
  #DcUser.all.each {|dc| p '**', dc.dc_user_roles.to_a }  
  login('admin','error')
  assert_nil(session[:user_id], "Login should fail")

  login('admin','secret')
  assert_not_nil(session[:user_id], "Login failed")
  
#  assert_select 'div.dc-form-error' #, 'Should have div dc-form-frame'
#  assert_response :ok, 'Should return form result_set'
  
end

#######################################################################
test 'test cmsedit' do
# Wrong password. No user logged in
  login('admin','error')
  get :index, table: :dc_user, formname: 'dc_user'
  assert_select 'div.dc-form-error'
# User guest should not be able to see data
  login('guest','secret')
  get :index, table: :dc_user, formname: 'dc_user'
  assert_select 'div.dc-form-error'
# Load dc_user edit form 
  login('admin','secret')
  get :index, table: :dc_user, formname: 'dc_user'
# check for dc-action-menu div
  assert_select 'div#dc-action-menu'
# it should have three action buttons
  assert_select "ul" do
    assert_select "li", 4
  end  
# it should have three documents listed
  assert_select "table.dc-result" do
    assert_select "tr", 3
  end  
  user = DcUser.find_by(username: 'guest')
  get :edit, table: :dc_user, formname: 'dc_user', id: user.id
# it should have dc.menu  and 12 options since menu is shown on top and bottom
  assert_select "table.dc-menu" do
    assert_select "td", 12 
  end  

  assert_select "#td_record_username" do
    assert_select "input"
    assert_select "[value=?]", user.username
  end  

# it should have iframe dc_user_roles
  assert_select "iframe#if_dc_user_roles"
# iframe could not be tested. Just check if dc_user_role form can be loaded
  get :index, table: 'dc_user;dc_user_role', formname: 'dc_user_role', ids: user.id
  assert_select 'div#dc-action-menu'

  
# it should have dc.menu  and 12 options since menu is shown on top and bottom
#  assert_select "table.dc-menu" do
#    assert_select "td", 12 
#  end  


#  assert_select "iframe#if_dc_user_roles" 
#  assert_select "table.dc-result" do
#  assert_select "#if_dc_user_roles" do
#    assert_select "div#dc-action-menu" do
#      assert_select "tr", 3
#    end  
  
  #  p response
# check for dc-action-menu div
#  assert_select 'div#dc-action-menu'  
  
end
#db_clear

end
