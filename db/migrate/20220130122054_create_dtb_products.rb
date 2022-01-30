class CreateDtbProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :dtb_products do |t|

      t.timestamps
    end
  end
end
