class CreateRecycleLists < ActiveRecord::Migration[5.2]
  def change
    create_table :recycle_lists do |t|
      t.string :user_fb_id
      t.string :item

      t.timestamps
    end
  end
end
