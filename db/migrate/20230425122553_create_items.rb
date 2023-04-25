class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.string :category, null: false
      t.integer :price, null: false
      t.bigint :seller_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end


