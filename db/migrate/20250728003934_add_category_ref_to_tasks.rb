class AddCategoryRefToTasks < ActiveRecord::Migration[7.2]
  def change
    add_reference :tasks, :category, null: true, foreign_key: true
  end
end
