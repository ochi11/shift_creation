class Shift < ApplicationRecord
    belongs_to :hope_shift
    belongs_to :admin
    
  def shift_title
    "<確定>" + hope_shift.end_user.name + "/" + "勤務:" + working_time_start.to_s + "-" + working_time_end.to_s + "時" + "/" + "休憩:" + break_time_start.to_s + "-" + break_time_end.to_s + "時"
  end
  
  def start_date
  end
  
  def end_date
  end
  
  def end_user
  end
end
