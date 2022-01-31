class CreateDtbShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :dtb_shippings do |t|
      t.string :postalcode
      t.string :state
      t.string :city
      t.string :Street
      t.string :building
      t.string :phone
      t.string :recode_id
      t.timestamps
    end
  end
end
