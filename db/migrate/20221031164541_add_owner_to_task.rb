class AddOwnerToTask < ActiveRecord::Migration[7.0]
  def change
    # original migration --> add_reference :tasks, :user, null: false, foreign_key: true
    # --> We are changing the migration to add a reference to the OWNER of the task
    # new migration --> add_reference :tasks, :owner, null: false, foreign_key: { to_table: :users }, index: true
    add_reference :tasks, :owner, null: false, foreign_key: { to_table: :users }, index: true
  end
end
