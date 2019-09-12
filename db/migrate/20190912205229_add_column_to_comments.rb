class AddColumnToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :imageable, polymorphic: true
  end
end
