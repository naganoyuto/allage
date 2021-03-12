class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :text
      t.text :tops_shop, null:false
      t.text :tops_prefecture, null:false
      t.text :tops_brand, null:false
      t.string :tops_price
      t.string :pants_shop, null:false
      t.integer :pants_prefecture_id, null:false
      t.string :pants_brand, null:false
      t.integer :pants_price
      t.string :shoes_shop, null:false
      t.integer :shoes_prefecture_id, null:false
      t.string :shoes_brand, null:false
      t.integer :shoes_price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
