class CreateUserComments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comments do |t|
      t.integer :user_id, null: false
      t.integer :comment_id, null: false

      t.timestamps
    end
    add_index :user_comments, :user_id
    add_index :user_comments, :comment_id
  end
end
