class AddStartDateToHopeShifts < ActiveRecord::Migration[6.1]
  def change
    add_column :hope_shifts, :start_date, :datetime
    add_column :hope_shifts, :end_date, :datetime
  end
end
