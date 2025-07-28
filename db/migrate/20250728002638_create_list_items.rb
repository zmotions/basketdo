class CreateListItems < ActiveRecord::Migration[7.2]
  def change
    create_table :list_items do |t|
      t.string :name
      t.boolean :done
      t.timestamps
    end
  end
end
