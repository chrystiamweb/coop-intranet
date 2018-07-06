// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require ckeditor/init
//= require rails-ujs
//= require momentjs
//= require fullcalendar
//= require activestorage
//= require turbolinks
//= require materialize-sprockets
//= require_tree .
//= require_self

var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
          },
        selectable: true,
        selectHelper: true,
        editable: true,
        eventLimit: true,
    });
  })
};
$(document).on('turbolinks:load', initialize_calendar);