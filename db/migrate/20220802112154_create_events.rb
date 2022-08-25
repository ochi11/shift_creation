class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :body
      t.datetime :start_date
      t.datetime :end_date
      t.integer :working_time_start
      t.integer :working_time_end
      t.date :date

      t.timestamps
    end
  end
end
