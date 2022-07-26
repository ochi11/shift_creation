class CreateHopeShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :hope_shifts do |t|
      t.integer :shift_id, null: false
      t.integer :end_user_id, null: false
      t.boolean :is_active, null: false, default: true #シフトの確定フラグ

      t.timestamps
    end
  end
end
