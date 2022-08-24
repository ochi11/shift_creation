json.array!(@events) do |hope_shift|
  json.extract! hope_shift, :id, :date  
  json.start hope_shift.start_date
end
