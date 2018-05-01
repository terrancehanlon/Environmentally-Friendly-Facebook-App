class AddNameToRecycleList < ActiveRecord::Migration[5.2]
  def change
    add_column :recycle_lists, :name, :string
  end
end
