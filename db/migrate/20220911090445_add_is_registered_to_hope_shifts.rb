class AddIsRegisteredToHopeShifts < ActiveRecord::Migration[6.1]
  def change
    add_column :hope_shifts, :is_registered, :boolean, default: false, null: false #希望（仮確定）シフトを確定シフトへ登録するフラグ
  end
end
