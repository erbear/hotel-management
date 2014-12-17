class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street
      t.integer :buildingNumber
      t.integer :flatNumber

      t.timestamps
    end
  end
end
