class RemoveWorkingTimeStartFromHopeShifts < ActiveRecord::Migration[6.1]
  def change
    remove_column :hope_shifts, :working_time_start, :integer
  end
end
