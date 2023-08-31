class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.references :post, foreign_key: true
      t.timestamps
    end
    add_index :likes, :post_id
  end
end
