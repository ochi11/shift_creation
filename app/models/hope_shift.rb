class HopeShift < ApplicationRecord
  belongs_to :end_user
  
  has_many :shifts, dependent: :destroy
  
  def shift_title
    end_user.name + "/" + "勤務:" + working_time_start.to_s + "-" + working_time_end.to_s + "時"
  end
end
