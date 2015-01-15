class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :count
      t.date :date

      t.timestamps
    end
  end
end
