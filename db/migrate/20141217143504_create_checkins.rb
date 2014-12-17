class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.references :reservation, index: true
      t.float :paid
      t.date :startDate
      t.date :endDate
      t.boolean :keysGiven
      t.boolean :keysBack

      t.timestamps
    end
  end
end
