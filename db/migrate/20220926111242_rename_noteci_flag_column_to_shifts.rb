class RenameNoteciFlagColumnToShifts < ActiveRecord::Migration[6.1]
  def change
    rename_column :shifts, :noteci_flag, :notice_flag
  end
end
