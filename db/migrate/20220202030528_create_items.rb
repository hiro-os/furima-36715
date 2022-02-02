class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :version
      t.string :category
      t.string :situation
      t.string :burdener
      t.string :area
      t.string :days
      t.integer :price
      t.integer :user_id

      t.timestamps
    end
  end
end
