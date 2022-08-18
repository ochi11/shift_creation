class AddWorkingTimeStartToHopeShifts < ActiveRecord::Migration[6.1]
  def change
    add_column :hope_shifts, :working_time_start, :integer
  end
end
