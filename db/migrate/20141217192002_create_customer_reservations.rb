class CreateCustomerReservations < ActiveRecord::Migration
  def change
    create_table :customer_reservations do |t|
      t.references :reservation, index: true
      t.references :customer, index: true

      t.timestamps
    end
  end
end
