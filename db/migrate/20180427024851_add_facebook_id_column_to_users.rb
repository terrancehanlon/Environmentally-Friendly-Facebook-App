class AddFacebookIdColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fb_id, :string
  end
end
