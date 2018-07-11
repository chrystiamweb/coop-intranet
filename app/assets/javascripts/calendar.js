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
          $('#event_date_range').val(moment(start).format("DD-MM-YYYY  HH:mm:ss") + ' - ' + moment(end).format("DD-MM-YYYY  HH:mm:ss"))
          date_range_picker();
          $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
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
          $('#event_date_range').val(moment(event.start).format("DD-MM-YYYY  hh:mm:ss") + ' - ' + moment(event.end).format("DD-MM-YYYY  hh:mm:ss"))
          date_range_picker();
          $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));      
          var a =$('#event_date_range').val(moment(event.start).format("DD-MM-YYYY  hh:mm:ss") + ' - ' + moment(event.end).format("DD-MM-YYYY  hh:mm:ss"));

          alert( a);
        });
      }
    });
  })
};
$(document).on('turbolinks:load', initialize_calendar);

