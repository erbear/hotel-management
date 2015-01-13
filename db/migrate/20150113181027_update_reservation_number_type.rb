class UpdateReservationNumberType < ActiveRecord::Migration
  def change
    change_table :reservations do |t|
      t.change :reservationNumber, :string
    end
  end
end
