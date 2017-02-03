class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.belongs_to :barre_type, null: false
      t.belongs_to :timeslot, null: false
      t.date :date, null: false
      t.belongs_to :instructor, null: false
      t.timestamps
    end
  end
end
