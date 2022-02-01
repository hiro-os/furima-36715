class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :version 
      t.string :category
      t.string :situation
      t.string :burdener
      t.string :area
      t.string :days
      t.string :price
      t.integer :user_id

      t.timestamps
    end
  end
end
