class CreateListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_items do |t|
      t.string :name
      t.integer :list_id

      t.timestamps
    end
  end
end
