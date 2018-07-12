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
          $('#event_date_range').val(moment(start).format("%Y-%m-%dT%H:%M:%S") + ' - ' + moment(end).format("%Y-%m-%dT%H:%M:%S"))          
          $('.start_hidden').val(moment(start).format('%Y-%m-%dT%H:%M:%S'));
          $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));          
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
          $('#event_date_range').val(moment(event.start).format("%Y-%m-%dT%H:%M") + ' - ' + moment(event.end).format("%Y-%m-%dT%H:%M"))          
          $('.start_hidden').val(moment(event.start).format('%Y-%m-%dT%H:%M'));
          $('.end_hidden').val(moment(event.end).format('%Y-%m-%dT%H:%M'));          
        });
      }
    });
  })
};
$(document).on('turbolinks:load', function() {
  initialize_calendar();
});


