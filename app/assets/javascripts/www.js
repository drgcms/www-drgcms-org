
/**************************************************************
 * Plugins search ajax call.
 **************************************************************/
do_plugins_search = function() {
  params = {search: $("#plugins-search").val(), sekcija: $("#plugins-result").val() }

  $.ajax({
      url:      "plugins",
      type:     "POST",
      dataType: "json",
      data:     params,
      success:  function(data) {
        process_json_result(data);
      }
   });  
}

/**************************************************************
 * Plugins search callback 
 **************************************************************/
$(document).ready(function() {
  $('#plugins-search').on('input', function(e) {
    if ( $("#plugins-search").val().length > 1) do_plugins_search();
    if ( $("#plugins-search").val().length == 0) do_plugins_search();
  });
});
