class CreateInstructors < ActiveRecord::Migration[5.0]
  def change
    create_table :instructors do |t|
      t.string :full_name, null: false
      t.text :bio, null: false
      t.timestamps
    end
  end
end
