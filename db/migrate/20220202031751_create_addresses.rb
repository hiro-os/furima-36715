class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode
      t.string :state
      t.string :city
      t.string :street
      t.string :building
      t.string :phone
      
      t.timestamps
    end
  end
end
