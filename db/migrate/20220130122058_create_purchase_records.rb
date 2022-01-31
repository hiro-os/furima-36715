class CreatePurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_records do |t|
      t.string :Product_id
      t.string :Product_title
      t.timestamps
    end
  end
end
