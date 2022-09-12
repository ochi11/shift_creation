json.array!(@events) do |hope_shift|
  json.extract! hope_shift, :id, :date
  json.title hope_shift.shift_title
  json.start hope_shift.start_date
  json.end hope_shift.end_date
end