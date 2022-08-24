class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.integer :admin_id, null: false
      t.integer :hope_shift_id, null: false
      t.integer :working_time_start, null: false
      t.integer :working_time_end, null: false
      t.integer :break_time_start, null: false
      t.integer :break_time_end, null: false
      t.date :date, null: false
      t.boolean :noteci_flag, null: false, default: true

      t.timestamps
    end
  end
end
