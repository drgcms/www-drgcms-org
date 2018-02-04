require "application_system_test_case"

class CmseditsTest < ApplicationSystemTestCase
def login
  visit '/cms/login'
  assert_selector "h2", text: "CMS login"
  fill_in 'record_username', with: 'admin'
  fill_in 'record_password', with: 'secret'
  find('input[type="submit"]').click
  assert_selector "#cmsedit-div"
end

=begin
  test "browse_and_update_collection" do
    login
    click_link 'CMS'
    assert_selector ".cmsedit-table"
     
#     page.first('.cmsedit-top-level-menu').click
    find(:xpath, "(//li[text()='CMS main tables'])").click
    find(:xpath, "(//li[text()='CMS advanced'])").click
    click_link_or_button 'Sites'
    # iframe_cms 
    page.within_frame('iframe_cms') do
      find(:xpath, "(.//a)[5]").click  # Edit. Click on fifth element
      assert_equal find_field('record_name').value, 'www.mysite.com'

      find(:xpath, "(//li[text()='Parameters'])").click # Click parameters tab
      assert_equal find_field('record_menu_name').value, 'site-menu'

      find(:xpath, "(//li[text()='Permissions'])").click # Click permissions tab

# if_dc_policies iframe
      page.within_frame('if_dc_policies') do
        find(:xpath, "(.//a)[3]").click  # Edit. Click on third element
        assert_equal find_field('record_name').value, 'Default policy'
        
# if_dc_policy_rules iframe
        page.within_frame('if_dc_policy_rules') do
          find(:xpath, "(.//a)[3]").click  # Edit. Click on third element
          # value should be 2
          assert_equal find_field('record_permission').value, '2'   
          find_field('record_permission').find(:option, 'CAN_ADMIN').select_option
          # press Save and back. First
          page.first("input[type=submit][value='Save & back']").click
# OK          page.first("input[type=submit][value='Save']").click
#          find(:xpath, "(//a[text()=' Back'])[1]").click
#          page.first(".fa-arrow-left").click
#                find(:xpath, "(.//a)[1]").click  # Edit. Click on fifth element

#          page.go_back
          # If OK, there should be permission row with CAN_ADMIN
#          sleep 1
#          assert find(:xpath, "(//td[text()='CAN_ADMIN'])") 
        end
        
#        fill_in 'record_name', with: 'bla bla'
        page.first("input[type=submit][value='Save & back']").click
#        assert find(:xpath, "(//td[text()='bla bla'])")
      end
    end     
        sleep 2
  end
=end  
  test "cmsedit_tests" do
    exit
    
    login
    visit "/cmsedit?formname=dc_site&table=dc_site"
    assert_selector ".dc-form-frame"

    find(:xpath, "(.//a)[5]").click  # Edit. Click on fifth element
    assert_equal find_field('record_name').value, 'www.mysite.com'
    fill_in 'record_description', with: 'Description'
    
    page.first("input[type=submit][value='Save & back']").click
    assert find(:xpath, "(//td[text()='Description'])")
#    sleep 2
#    exit
    find(:xpath, "(.//a)[5]").click  # Edit. Click on fifth element
    find(:xpath, "(//li[text()='Parameters'])").click # Click parameters tab
    assert_equal find_field('record_menu_name').value, 'site-menu'

    find(:xpath, "(//li[text()='Permissions'])").click # Click permissions tab

# if_dc_policies iframe
    page.within_frame('if_dc_policies') do
      find(:xpath, "(.//a)[3]").click  # Edit. Click on third element
      assert_equal find_field('record_name').value, 'Default policy'
      fill_in 'record_name', with: 'New Description'
      page.first("input[type=submit][value='Save & back']").click
      assert find(:xpath, "(//td[text()='New Description'])")

      find(:xpath, "(.//a)[3]").click  # Edit. Click on third element
      # if_dc_policy_rules iframe
      page.within_frame('if_dc_policy_rules') do
        find(:xpath, "(.//a)[3]").click  # Edit. Click on third element
          # value should be 2
        assert_equal find_field('record_permission').value, '2'   
   #     find_field('record_permission').find(:option, 'CAN_ADMIN').select_option
          # press Save and back. First
        page.first("input[type=submit][value='Save & back']").click
# works only in first iframe        
#        assert find(:xpath, "(//td[text()='CAN_ADMIN'])")
      end
    end
  end
  
   test "cmsedit_form_fields_test" do
     login
     visit "/cms/new?formname=demo_form&table=dc_memory"
     assert_selector ".dc-form-frame"
# textfield field11
     value = 'Value field11'
     fill_in 'record_field11', with: value
     assert_equal find_field('record_field11').value, value
# textfield2 should have my-class
     within("#td_record_field2") {
       assert find('.my-class')
     }
# textfield3 readonly field
     within("#td_record_field3") {
       assert find(:xpath, "(//td[text()='ReadOnly field 1'])")
     }
     
   end

end