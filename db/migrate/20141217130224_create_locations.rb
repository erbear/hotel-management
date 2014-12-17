class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.references :type, index: true
      t.references :level, index: true
      t.integer :places
      t.float :price
      t.float :fee
      t.boolean :active

      t.timestamps
    end
  end
end
