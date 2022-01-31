class CreateDtbProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :dtb_products do |t|
      t.string :title
      t.text :version
      t.string :category
      t.string :situation
      t.string :burdener
      t.string :area
      t.string :Days
      t.string :price
      t.string :commission
      t.string :profit
      t.string :user_id
      t.string :recode_id
      t.timestamps
    end
  end
end
