class CreatePurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_records do |t|
      t.string :product_id
      t.string :product_title
      t.timestamps
    end
  end
end
