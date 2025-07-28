class AddFieldsTasks < ActiveRecord::Migration[7.2]
  def up
    add_column :tasks, :priority, :integer, default: 2
    add_column :tasks, :status, :integer, default: 0
    add_column :tasks, :color, :string, default: '#ffffff'
    rename_column :tasks, :estimated, :duration
  end

  def down
    remove_column :tasks, :priority
    remove_column :tasks, :status
    remove_column :tasks, :color
    rename_column :tasks, :duration, :estimated
  end
end