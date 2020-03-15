class DemoFormController < DcApplicationController

####################################################################
# Processing ajax call from DRG Form.
# - collect data from input fields
# - update div_td_record_result with new value
# - set info and error message
# - open pdf document in new window
####################################################################
def show_result
  html = ''
  params['record'].each do |field|
    html << "#{field}=#{params['record'][field]}<br>"
  end
  field41 = DrgcmsFormFields::DateSelect.get_data(params, 'field41')
  field42 = DrgcmsFormFields::DatetimeSelect.get_data(params, 'field42')
  html << "field41=#{field41}<br>"
  html << "field42=#{field42}<br>"
  response = { 'msg_info' => 'This ajax call resulted in 4 operations.<br>
- set this messega<br>
- set error message<br>
- set result field in result tab<br>
- opened pdf file in new window.',
              'msg_error' => 'This is error message!',
              '#div_td_record_result' => html, 
              'window' => '/files/demo_form_test.pdf' }
  
  render json: response
end

end
