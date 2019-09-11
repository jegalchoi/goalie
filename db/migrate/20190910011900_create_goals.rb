class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :details, null: false
      t.boolean :visibility, null: false, default: true
      t.boolean :status, null: false, default: false
      t.integer :cheers, null: false, default: 0
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
