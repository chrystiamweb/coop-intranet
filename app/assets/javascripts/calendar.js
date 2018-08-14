var initialize_calendar;
initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      locale: 'pt-br',
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
          $('#event_date_range').val(moment(start).format('DD/MM/Y HH:mm') + ' - ' + moment(end).format('DD/MM/Y h:mm'))          
          $('.start_hidden').val(moment(start).format('DD/MM/Y H:mm'));
          $('.end_hidden').val(moment(end).format('DD/MM/Y H:mm')); 
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
         $('#event_date_range').val(moment(event.start).format("Y-m-d TH:M") + ' - ' + moment(event.end).format('Y/m/d T H:M'))          
         $('.start_hidden').val(moment(event.start));
         $('.end_hidden').val(moment(event.end));          
        });
      }
    });
  })

  

  $(document).ready(function() {

    $('.calendar-list').fullCalendar({
        locale: 'pt-br',
        header: {        
          left: 'prev,next',
          center: 'title',
          right: 'listDay,listWeek'
      },

      // customize the button names,
      // otherwise they'd all just say "list"
      views: {
        listDay: { buttonText: 'Dia' },
        listWeek: { buttonText: 'Semana' }
      },

      defaultView: 'listWeek',     
      navLinks: true, // can click day/week names to navigate views     
      eventLimit: true, // allow "more" link when too many events
      events: '/events.json',
    });
  });
};

$(document).on('turbolinks:load', function() {
  initialize_calendar();
});