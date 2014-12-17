class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :location, index: true
      t.date :startDate
      t.date :endDate
      t.integer :reservationNumber
      t.boolean :deposit

      t.timestamps
    end
  end
end
