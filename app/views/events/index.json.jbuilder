json.array! @events do |event|
  date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M'
  event_start = event.start.strftime('%Y-%m-%d') + " 08:00"
  event_end = event.end.strftime('%Y-%m-%d') + " 19:00"
  json.id event.id
  json.title event.title    
  json.start event_start.to_datetime.strftime(date_format)
  json.end event_end.to_datetime.strftime(date_format)
  json.color event.color unless event.color.blank?
  json.allDay event.all_day_event? ? true : false
  json.update_url event_path(event, method: :patch)
  json.edit_url edit_event_path(event)
  end