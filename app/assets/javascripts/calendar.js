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
      events: '/events.json',

      select: function(start, end) {
        $.getScript('/events/new', function() {         
        });

        calendar.fullCalendar('unselect');
      },

      eventDrop: function(event, delta, revertFunc) {
        event_data = { 
          event: {
            id: event.id,
            start: event.start.format(),
            end: event.end.format()
          }
        };
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },
      
      eventClick: function(event, jsEvent, view) {
        $.getScript(event.edit_url, function() {
          $('#event_date_range').val(moment(event.start).format("YYYY-MM-DD") + ' - ' + moment(event.end).format("YYYY-MM-DD"))          
          $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD'));
          $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD'));
          $('.start_time').val(moment(event.end).format('HH:mm'));
          $('.end_time').val(moment(event.end).format('HH:mm'));
        });
      }
    });
  })
};
$(document).on('turbolinks:load', function() {
  initialize_calendar();
  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd' 
  });  
  $('.timepicker').timepicker({});  
});


