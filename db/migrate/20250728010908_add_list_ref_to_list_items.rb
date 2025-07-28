class AddListRefToListItems < ActiveRecord::Migration[7.2]
  def change
    add_reference :list_items, :list, null: true, foreign_key: true
  end
end
