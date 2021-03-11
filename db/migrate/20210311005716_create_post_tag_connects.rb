class CreatePostTagConnects < ActiveRecord::Migration[6.0]
  def change
    create_table :post_tag_connects do |t|

      t.timestamps
    end
  end
end
