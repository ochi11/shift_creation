json.array!(Event.all) do |event|
  json.title event.title
  json.start event.start_date
  json.end event.end_date
  json.url 'https://google.com'
end