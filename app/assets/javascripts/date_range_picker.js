var date_range_picker;
date_range_picker = function() {
  $('.date-range-picker').each(function(){
    $(this).daterangepicker({
        timePicker: true,       
        timePicker24Hour: true,
    }, function(start, end, label) {
      $('.start_hidden').val(start.format('YYYY-MM-DD HH:mm'));
      $('.end_hidden').val(end.format('YYYY-MM-DD HH:mm'));      
    });
  })
};


$(document).on('turbolinks:load', function() {
  date_range_picker,
  $('select').formSelect();
 
});


$(document).ready(function(){
  $('select').formSelect();
});
