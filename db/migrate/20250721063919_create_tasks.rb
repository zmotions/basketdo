class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.float :estimated
      t.datetime :due_on

      t.timestamps
    end
  end
end
