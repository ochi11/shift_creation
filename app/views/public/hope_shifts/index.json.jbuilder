json.array!(@events) do |hope_shift|
  json.extract! hope_shift, :id, :date
  json.title hope_shift.date
  json.start hope_shift.working_time_start
  json.end hope_shift.working_time_end
end
