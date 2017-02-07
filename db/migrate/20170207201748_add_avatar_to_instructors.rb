class AddAvatarToInstructors < ActiveRecord::Migration[5.0]
  def change
    add_column :instructors, :avatar, :string
  end
end
