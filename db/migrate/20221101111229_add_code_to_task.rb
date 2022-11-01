class AddCodeToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :code, :string
  end
end
