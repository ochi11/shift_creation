class Shift < ApplicationRecord
    belongs_to :hope_shift
    belongs_to :admin
    
  def shift_title
    end_user.name + "/" + "勤務:" + working_time_start.to_s + "-" + working_time_end.to_s + "時" + "/" + "休憩:" + break_time_start.to_s + "-" + break_time_end.to_s + "時"
  end
end
