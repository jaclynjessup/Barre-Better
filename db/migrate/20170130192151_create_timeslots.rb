class CreateTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :timeslots do |t|
      t.string :start_time, null: false
      t.string :end_time, null: false
    end
  end
end
