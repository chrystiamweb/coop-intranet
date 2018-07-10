//var date_range_picker;
//date_range_picker = function() {
//  $('.date-range-picker').each(function(){
//    $(this).daterangepicker({
//        timePicker: true,
//        timePickerIncrement: 30,
//        alwaysShowCalendars: true
//    }, function(start, end, label) {
//      $('.start_hidden').val(start.format('YYYY-MM-DD HH:mm'));
//      $('.end_hidden').val(end.format('YYYY-MM-DD HH:mm'));
//    });
//  })
//};
//$(document).on('turbolinks:load', date_range_picker);

var date_range_picker;
date_range_picker = function() {
  $('.datepicker').each(function(){
    $(this).daterangepicker(function(start, end, label) {
    $('.start_hidden').datepicker({
        format: 'yyyy-mm-dd' 
    });
      
    $('.end_hidden').datepicker({
        format: 'yyyy-mm-dd' 
    });
      
          
    });
  })
};
$(document).on('turbolinks:load', date_range_picker);