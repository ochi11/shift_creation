class HopeShift < ApplicationRecord
  belongs_to :end_user
  
  has_many :shifts, dependent: :destroy
  
  def shift_title
    end_user.name + "/" + working_time_start.to_s + "-" + working_time_end.to_s
  end
end
