class ChangeGoalIdColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :goal_comments, :user_id, :comment_id
  end
end
