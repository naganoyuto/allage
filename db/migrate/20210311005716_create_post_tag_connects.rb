class CreatePostTagConnects < ActiveRecord::Migration[6.0]
  def change
    create_table :post_tag_connects do |t|
      t.references :post, foreign_key: true
      t.references :tag, forein_key: true
      t.timestamps
    end
  end
end
