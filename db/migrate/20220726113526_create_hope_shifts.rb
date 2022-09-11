class CreateHopeShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :hope_shifts do |t|
      t.integer :end_user_id, null: false
      t.boolean :is_active, null: false, default: true #希望シフトの仮確定フラグ
      t.integer :working_time_start, null: false
      t.integer :working_time_end, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
