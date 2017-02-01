class CreateUserHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :user_histories do |t|
      t.belongs_to :user, null: false
      t.belongs_to :training, null: false
      t.timestamps
    end
  end
end
