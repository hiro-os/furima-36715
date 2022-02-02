class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :version
      t.integer :category_id
      t.integer :situation_id
      t.integer :burdener_id
      t.integer :area_id
      t.integer :order_day_id
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
