class CreateDtbShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :dtb_shippings do |t|

      t.timestamps
    end
  end
end
