class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.string :name, null: false
      t.belongs_to :timeslot, null: false
      t.date :date, null: false
      t.integer :instructor_id, null: false
      t.timestamps
    end
  end
end
